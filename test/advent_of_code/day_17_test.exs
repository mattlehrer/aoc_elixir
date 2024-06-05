defmodule AdventOfCode.Day17Test do
  use ExUnit.Case

  import AdventOfCode.Day17

  # @tag :skip
  test "part1" do
    input = """
    20
    15
    10
    5
    5
    """

    result = part1(input)

    assert result == 4
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
