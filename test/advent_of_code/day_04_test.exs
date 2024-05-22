defmodule AdventOfCode.Day04Test do
  use ExUnit.Case

  import AdventOfCode.Day04

  @tag :skip
  test "part1" do
    input = "abcdef"
    result = part1(input)

    assert result == 609_043

    input = "pqrstuv"
    result = part1(input)

    assert result == 1_048_970
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
