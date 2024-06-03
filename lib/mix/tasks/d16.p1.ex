defmodule Mix.Tasks.D16.P1 do
  use Mix.Task

  import AdventOfCode.Day16

  @shortdoc "Day 16 Part 1"
  def run(args) do
    day = 16
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
