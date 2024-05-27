defmodule AdventOfCode.Day10 do
  def part1(input) do
    input
    |> String.trim()
    |> String.graphemes()
    |> loop(40)
    # |> tap(&IO.inspect/1)
    |> String.length()
  end

  def part2(_args) do
  end

  defp count_consecutive([], result), do: result

  defp count_consecutive([head | tail], []) do
    count_consecutive(tail, [{1, head}])
  end

  defp count_consecutive([head | tail], [{count, head} | result]) do
    count_consecutive(tail, [{count + 1, head} | result])
  end

  defp count_consecutive([head | tail], result) do
    count_consecutive(tail, [{1, head} | result])
  end

  defp back_to_string(list) do
    Enum.reduce(list, "", fn {count, char}, acc ->
      acc <> Integer.to_string(count) <> char
    end)
  end

  defp loop(list, 1) do
    list
    |> count_consecutive([])
    |> Enum.reverse()
    |> back_to_string()
  end

  defp loop(list, count) when count > 1 do
    list
    |> count_consecutive([])
    |> Enum.reverse()
    |> back_to_string()
    |> String.graphemes()
    |> loop(count - 1)
  end
end
