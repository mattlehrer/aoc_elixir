defmodule AdventOfCode.Day17 do
  # @full 25
  @full 150

  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> process()
  end

  def part2(_args) do
  end

  defp process(containers, remaining \\ @full)
  defp process(_, 0), do: 1
  defp process([], _), do: 0

  defp process([hd | tl], remaining) do
    tl = Enum.filter(tl, fn n -> n <= remaining end)

    if hd <= remaining do
      process(tl, remaining - hd) + process(tl, remaining)
    else
      process(tl, remaining)
    end
  end
end
