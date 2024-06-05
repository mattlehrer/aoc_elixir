defmodule AdventOfCode.Day15Test do
  use ExUnit.Case

  import AdventOfCode.Day15

  @tag :skip
  test "part1" do
    input = """
    Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
    Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
    """

    result = part1(input)

    assert result == 62_842_880
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
