defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  @tag :skip
  test "part1" do
    input = nil
    result = part1(input)

    assert result
  end

  @tag :skip
  test "part2" do
    input = ")"
    result = part2(input)

    assert result == 1
  end
end
