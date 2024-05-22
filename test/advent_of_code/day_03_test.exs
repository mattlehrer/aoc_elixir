defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  @tag :skip
  test "part1" do
    input = ">"
    result = part1(input)

    assert result == 2

    input = "^>v<"
    result = part1(input)

    assert result == 4

    input = "^v^v^v^v^v"
    result = part1(input)

    assert result == 2
  end

  @tag :skip
  test "part2" do
    input = "^v"
    result = part2(input)

    assert result == 3

    input = "^>v<"
    result = part2(input)

    assert result == 3

    input = "^v^v^v^v^v"
    result = part2(input)

    assert result == 11
  end
end
