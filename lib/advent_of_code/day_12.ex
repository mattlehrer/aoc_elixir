defmodule AdventOfCode.Day12 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&split/1)
    |> List.flatten()
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> decode()
    |> List.wrap()
    |> List.flatten()
    |> reduce
  end

  defp split(line) do
    Regex.scan(~r/-?\d*/, line)
    |> List.flatten()
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&String.to_integer/1)
  end

  defp reduce(list) when is_list(list) do
    Enum.reduce(list, 0, fn elem, acc -> acc + reduce(elem) end)
  end

  defp reduce(n) when is_integer(n) do
    n
  end

  defp reduce(n) when is_binary(n) do
    0
  end

  defp reduce(m) when is_map(m) do
    if Map.values(m) |> Enum.member?("red") do
      0
    else
      Map.values(m)
      |> List.flatten()
      |> reduce()
    end
  end

  defp decode(json_string) do
    {_, result} = JSON.decode(json_string)
    result
  end
end
