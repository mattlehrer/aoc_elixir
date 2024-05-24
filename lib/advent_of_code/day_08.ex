defmodule AdventOfCode.Day08 do
  def part1(input) do
    input
    |> String.split(~r{(\r\n|\r|\n)}, trim: true)
    |> count_chars
    |> subtract_memory_usage
  end

  def part2(_args) do
  end

  defp count_chars(input) do
    count =
      input
      |> Enum.map(&String.length/1)
      |> Enum.sum()

    {input, count}
  end

  defp subtract_memory_usage({input, count}) do
    usage =
      input
      |> Enum.map(&actual_length/1)
      |> Enum.sum()

    IO.puts("count: #{count}; usage: #{usage}")

    count - usage
  end

  @esc_regex ~r/(\\\\|\\\"|\\x[\da-f]{2})/
  @empty_regex ~r/\"/
  def actual_length(line) do
    line
    |> unescape(@esc_regex, "*")
    |> unescape(@empty_regex, "")
    |> String.length()
  end

  @expansion_regex ~r/(\\|\")/
  def expanded_length(line), do: 2 + String.length(unescape(line, @expansion_regex, "**"))
  defp unescape(line, regex, replacement), do: Regex.replace(regex, line, replacement)
end
