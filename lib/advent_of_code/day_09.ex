defmodule AdventOfCode.Day09 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> to_map
    |> find_distances
    |> Enum.min()
  end

  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> to_map
    |> find_distances
    |> Enum.max()
  end

  defp to_map(lines) do
    lines
    |> Enum.reduce(%{}, fn line, map ->
      [from, "to", to, "=", distance] = String.split(line)
      distance = String.to_integer(distance)

      map =
        Map.update(map, from, %{to => distance}, fn existing_from ->
          Map.put(existing_from, to, distance)
        end)

      Map.update(map, to, %{from => distance}, fn existing_to ->
        Map.put(existing_to, from, distance)
      end)
    end)
  end

  defp find_distances(map) do
    map
    |> Map.keys()
    |> to_route_permutations()
    |> Enum.map(fn list ->
      list
      |> Enum.zip(Enum.drop(list, 1))
    end)
    |> Enum.map(
      &Enum.reduce(&1, 0, fn {from, to}, acc ->
        acc + (Map.get(map, from) |> Map.get(to))
      end)
    )
  end

  defp to_route_permutations([]), do: [[]]

  defp to_route_permutations(list) do
    for elem <- list, rest <- to_route_permutations(list -- [elem]), do: [elem | rest]
  end
end
