defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  @tag :skip
  test "part1" do
    input1 = "2x3x4"
    result1 = part1(input1)

    assert result1 == 58

    input2 = "1x1x10"
    result2 = part1(input2)

    assert result2 == 43
  end

  @tag :skip
  test "part2" do
    input = "2x3x4"
    result = part2(input)

    assert result == 34

    input = "1x1x10"
    result = part2(input)

    assert result == 14
  end
end
