defmodule AdventOfCode.Day06Test do
  use ExUnit.Case

  import AdventOfCode.Day06

  @tag :skip
  test "part1" do
    input = "turn on 0,0 through 999,999"
    result = part1(input)

    assert result == 1_000_000

    input = "toggle 0,0 through 999,0"
    result = part1(input)

    assert result == 1_000

    input = """
    turn on 0,0 through 999,999
    toggle 0,0 through 999,0
    """

    result = part1(input)

    assert result == 1_000_000 - 1_000

    input = """
    turn on 0,0 through 999,999
    toggle 0,0 through 999,0
    turn off 499,499 through 500,500
    """

    result = part1(input)

    assert result == 1_000_000 - 1_000 - 4
  end

  @tag :skip
  test "part2" do
    input = "turn on 0,0 through 0,0"
    result = part2(input)

    assert result == 1

    input = "toggle 0,0 through 999,999"
    result = part2(input)

    assert result == 2_000_000
  end
end
