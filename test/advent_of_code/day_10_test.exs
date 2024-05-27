defmodule AdventOfCode.Day10Test do
  use ExUnit.Case

  import AdventOfCode.Day10

  @tag :skip
  test "part1" do
    input = "1"
    result = part1(input)

    assert result == 2

    input = "11"
    result = part1(input)

    assert result == 2

    input = "21"
    result = part1(input)

    assert result == 4

    input = "1211"
    result = part1(input)

    assert result == 6

    input = "111221"
    result = part1(input)

    assert result == 6
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
