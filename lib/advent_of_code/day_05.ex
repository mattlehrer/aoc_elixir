defmodule AdventOfCode.Day05 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.filter(&three_vowels/1)
    |> Enum.filter(&double_letters/1)
    |> Enum.reject(&disallowed_strings/1)
    |> Enum.count()
  end

  def part2(_args) do
  end

  defp three_vowels(word) do
    word
    |> String.split("", trim: true)
    |> Enum.filter(fn char -> char in ~w(a e i o u) end)
    |> Enum.count() >= 3
  end

  defp double_letters(word) do
    Regex.match?(~r/(.)\1/, word)
  end

  defp disallowed_strings(word) do
    Regex.match?(~r/(ab|cd|pq|xy)/, word)
  end
end
