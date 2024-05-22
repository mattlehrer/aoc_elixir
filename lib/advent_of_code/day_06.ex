defmodule AdventOfCode.Day06 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_instruction/1)
    |> Enum.reduce(%{}, &apply_instruction/2)
    |> map_size()
  end

  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_instruction/1)
    |> Enum.reduce(%{}, &apply_instruction_2/2)
    |> Map.values()
    |> Enum.sum()
  end

  defp parse_instruction(instruction) do
    instruction
    |> String.split(" ", trim: true)
    |> case do
      ["turn", "on", from, "through", to] ->
        {:turn_on, parse_coordinates(from), parse_coordinates(to)}

      ["turn", "off", from, "through", to] ->
        {:turn_off, parse_coordinates(from), parse_coordinates(to)}

      ["toggle", from, "through", to] ->
        {:toggle, parse_coordinates(from), parse_coordinates(to)}
    end
  end

  defp parse_coordinates(string) do
    string
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp apply_instruction({:turn_on, from, to}, grid) do
    [from_x, from_y] = from
    [to_x, to_y] = to

    Enum.reduce(from_x..to_x, grid, fn x, acc ->
      Enum.reduce(from_y..to_y, acc, fn y, acc2 ->
        Map.put(acc2, {x, y}, true)
      end)
    end)
  end

  defp apply_instruction({:turn_off, from, to}, grid) do
    [from_x, from_y] = from
    [to_x, to_y] = to

    Enum.reduce(from_x..to_x, grid, fn x, acc ->
      Enum.reduce(from_y..to_y, acc, fn y, acc2 ->
        Map.delete(acc2, {x, y})
      end)
    end)
  end

  defp apply_instruction({:toggle, from, to}, grid) do
    [from_x, from_y] = from
    [to_x, to_y] = to

    Enum.reduce(from_x..to_x, grid, fn x, acc ->
      Enum.reduce(from_y..to_y, acc, fn y, acc2 ->
        case Map.has_key?(acc2, {x, y}) do
          true -> Map.delete(acc2, {x, y})
          false -> Map.put(acc2, {x, y}, true)
        end
      end)
    end)
  end

  defp apply_instruction_2({:turn_on, from, to}, grid) do
    [from_x, from_y] = from
    [to_x, to_y] = to

    Enum.reduce(from_x..to_x, grid, fn x, acc ->
      Enum.reduce(from_y..to_y, acc, fn y, acc2 ->
        Map.update(acc2, {x, y}, 1, fn v -> v + 1 end)
      end)
    end)
  end

  defp apply_instruction_2({:turn_off, from, to}, grid) do
    [from_x, from_y] = from
    [to_x, to_y] = to

    Enum.reduce(from_x..to_x, grid, fn x, acc ->
      Enum.reduce(from_y..to_y, acc, fn y, acc2 ->
        case Map.has_key?(acc2, {x, y}) do
          true ->
            case Map.get(acc2, {x, y}) do
              1 -> Map.delete(acc2, {x, y})
              _ -> Map.update(acc2, {x, y}, 0, fn v -> v - 1 end)
            end

          false ->
            acc2
        end
      end)
    end)
  end

  defp apply_instruction_2({:toggle, from, to}, grid) do
    [from_x, from_y] = from
    [to_x, to_y] = to

    Enum.reduce(from_x..to_x, grid, fn x, acc ->
      Enum.reduce(from_y..to_y, acc, fn y, acc2 ->
        Map.update(acc2, {x, y}, 2, fn v -> v + 2 end)
      end)
    end)
  end
end
