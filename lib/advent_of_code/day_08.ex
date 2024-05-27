defmodule AdventOfCode.Day08 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&count_chars/1)
    |> tap(&IO.inspect(&1, limit: :infinity))
    |> tap(&IO.inspect(length(&1)))
    |> Enum.sum()
  end

  def part2(_args) do
  end

  def count_chars(word) do
    count =
      word
      |> String.codepoints()
      |> Enum.reduce(0, fn c, acc ->
        cond do
          c == "\"" -> acc + 2
          c == "\\" -> acc + 2
          c >= "a" && c <= "z" -> acc + 1
          true -> acc + 4
        end
      end)

    # IO.puts("#{inspect(word)}: #{inspect(count)}, #{inspect(String.length(word))}")

    count - String.length(word)
  end
end
