defmodule Mix.Tasks.D12.P1 do
  use Mix.Task

  import AdventOfCode.Day12

  @shortdoc "Day 12 Part 1"
  def run(args) do
    day = 12
    year = 2015

    input = AdventOfCode.Input.get!(day, year)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
