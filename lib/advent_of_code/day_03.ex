defmodule AdventOfCode.Day03 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&move/1)
    |> List.flatten()
    |> Enum.uniq()
    |> Enum.count()
  end

  def part2(_args) do
  end

  defp move(string) do
    string
    |> Enum.reduce([{0, 0}], fn direction, [{x, y} | tl] ->
      case direction do
        ">" -> [{x + 1, y} | [{x, y} | tl]]
        "<" -> [{x - 1, y} | [{x, y} | tl]]
        "^" -> [{x, y + 1} | [{x, y} | tl]]
        "v" -> [{x, y - 1} | [{x, y} | tl]]
      end
    end)
  end
end
