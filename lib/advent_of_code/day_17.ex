defmodule AdventOfCode.Day17 do
  # @full 25
  @full 150

  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> process()
  end

  def part2(input) do
    tree =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> create_tree()

    min_depth =
      tree
      |> find_min_depth()

    flatten_depths(tree)
    |> Enum.filter(&(&1 == min_depth))
    |> Enum.count()
  end

  defp process(containers, remaining \\ @full)
  defp process(_, 0), do: 1
  defp process([], _), do: 0

  defp process([hd | tl], remaining) do
    tl = Enum.filter(tl, fn n -> n <= remaining end)

    if hd <= remaining do
      process(tl, remaining - hd) + process(tl, remaining)
    else
      process(tl, remaining)
    end
  end

  defp create_tree(containers, remaining \\ @full, depth \\ 0)
  defp create_tree(_, 0, depth), do: depth
  defp create_tree([], _, _), do: nil

  defp create_tree([hd | tl], remaining, depth) do
    tl = Enum.filter(tl, fn n -> n <= remaining end)

    %{
      left: create_tree(tl, remaining - hd, depth + 1),
      right: create_tree(tl, remaining, depth)
    }
  end

  defp find_min_depth(%{left: left, right: right}) when is_integer(left) and is_integer(right),
    do: min(left, right)

  defp find_min_depth(%{left: left}) when is_integer(left), do: left
  defp find_min_depth(%{right: right}) when is_integer(right), do: right

  defp find_min_depth(%{left: left, right: right}) when is_nil(left) and is_map(right),
    do: find_min_depth(right)

  defp find_min_depth(%{left: left, right: right}) when is_nil(right) and is_map(left),
    do: find_min_depth(left)

  defp find_min_depth(%{left: left, right: right}) when is_nil(right) and is_nil(left),
    do: :infinity

  defp find_min_depth(%{left: left, right: right}),
    do: min(find_min_depth(left), find_min_depth(right))

  def flatten_depths(map) do
    map
    |> Enum.reduce([], fn {_, value}, acc ->
      case value do
        %{} -> acc ++ flatten_depths(value)
        _ -> acc ++ [value]
      end
    end)
  end
end
