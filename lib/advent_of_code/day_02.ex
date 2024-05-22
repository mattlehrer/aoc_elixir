defmodule AdventOfCode.Day02 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "x"))
    |> Enum.map(&convert_to_integers(&1))
    |> Enum.map(&calculate_areas/1)
    |> Enum.map(&calculate_total_area/1)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "x"))
    |> Enum.map(&convert_to_integers(&1))
    |> Enum.map(&calculate_ribbon_length/1)
    |> Enum.sum()
  end

  defp convert_to_integers(list) do
    list
    |> Enum.map(&String.to_integer/1)
  end

  defp calculate_areas([l, w, h]) do
    [l * w, w * h, h * l]
  end

  defp calculate_total_area(areas) do
    2 * Enum.sum(areas) + Enum.min(areas)
  end

  defp calculate_ribbon_length([l, w, h]) do
    perimeter = 2 * Enum.min([l + w, w + h, h + l])
    volume = l * w * h

    perimeter + volume
  end
end
