defmodule AdventOfCode.Day07Test do
  use ExUnit.Case

  import AdventOfCode.Day07

  # @tag :skip
  test "part1" do
    input = """
    123 -> x
    456 -> y
    x AND y -> d
    x OR y -> e
    x LSHIFT 2 -> f
    y RSHIFT 2 -> g
    NOT x -> h
    NOT y -> i
    """

    result = part1(input)

    assert result == %{
             "d" => 72,
             "e" => 507,
             "f" => 492,
             "g" => 114,
             "h" => 65412,
             "i" => 65079,
             "x" => 123,
             "y" => 456
           }
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
