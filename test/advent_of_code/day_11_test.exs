defmodule AdventOfCode.Day11Test do
  use ExUnit.Case

  import AdventOfCode.Day11

  # @tag :skip
  test "part1" do
    input = "abcdefgh"
    result = part1(input)

    assert result == "abcdffaa"

    input = "ghijklmn"
    result = part1(input)

    assert result == "ghjaabcc"
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
