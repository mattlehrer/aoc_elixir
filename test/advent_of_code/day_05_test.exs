defmodule AdventOfCode.Day05Test do
  use ExUnit.Case

  import AdventOfCode.Day05

  # @tag :skip
  test "part1" do
    input = "ugknbfddgicrmopn"
    result = part1(input)

    assert result == 1

    input = "aaa"
    result = part1(input)

    assert result == 1

    input = "jchzalrnumimnmhp"
    result = part1(input)

    assert result == 0

    input = "haegwjzuvuyypxyu"
    result = part1(input)

    assert result == 0

    input = "dvszwmarrgswjxmb"
    result = part1(input)

    assert result == 0
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
