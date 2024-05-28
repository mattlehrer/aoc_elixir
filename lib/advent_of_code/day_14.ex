defmodule AdventOfCode.Day14 do
  @end_at 2503
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&distance/1)
    |> Enum.max()
  end

  def part2(_args) do
  end

  defp distance(line) do
    [
      _,
      "can",
      "fly",
      speed,
      "km/s",
      "for",
      fly_time,
      "seconds,",
      "but",
      "then",
      "must",
      "rest",
      "for",
      rest_time,
      "seconds."
    ] = String.split(line)

    speed = String.to_integer(speed)
    fly_time = String.to_integer(fly_time)
    rest_time = String.to_integer(rest_time)

    cycles = div(@end_at, fly_time + rest_time)
    speed * (cycles * fly_time + min(rem(@end_at, fly_time + rest_time), fly_time))
  end
end
