defmodule AdventOfCode.Day01 do
  def part1(input) do
    input
    |> String.graphemes()
    |> Enum.map(&paren_to_int(&1))
    |> Enum.sum()
  end

  def part2(input) do
    integers =
      input
      |> String.graphemes()
      |> Enum.map(&paren_to_int(&1))

    integers
    |> Enum.reduce_while({0, 1}, fn
      -1, {floor, position} when floor == 0 -> {:halt, position}
      -1, {floor, position} -> {:cont, {floor - 1, position + 1}}
      1, {floor, position} -> {:cont, {floor + 1, position + 1}}
    end)
  end

  defp paren_to_int("("), do: 1
  defp paren_to_int(")"), do: -1
end
