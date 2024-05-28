defmodule AdventOfCode.Day12Test do
  use ExUnit.Case

  import AdventOfCode.Day12

  @tag :skip
  test "part1" do
    input = """
    [1,2,3]
    """

    result = part1(input)

    assert result == 6

    input = """
    {"a":2,"b":4}
    """

    result = part1(input)

    assert result == 6

    input = """
    [1,2,3]
    {"a":2,"b":4}
    """

    result = part1(input)

    assert result == 12
  end

  @tag :skip
  test "part2" do
    input = """
    [1,2,3]
    """

    result = part2(input)

    assert result == 6

    input = """
    [1,{"c":"red","b":2},3]
    """

    result = part2(input)

    assert result == 4

    input = """
    {"d":"red","e":[1,2,3,4],"f":5}
    """

    result = part2(input)

    assert result == 0

    input = """
    [1,"red",5]
    """

    result = part2(input)

    assert result == 6
  end
end
