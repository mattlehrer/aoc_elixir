defmodule AdventOfCode.Day14 do
  @end_at 2503
  # @end_at 1000
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&distance/1)
    |> Enum.max()
  end

  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&all_distances/1)
    |> point_for_leading()
    # |> tap(&IO.inspect/1)
    |> unzip()
    |> Enum.map(&Enum.sum/1)
    |> Enum.max()
  end

  defp distance(line) do
    {speed, fly_time, rest_time} = parse(line)

    cycles = div(@end_at, fly_time + rest_time)
    speed * (cycles * fly_time + min(rem(@end_at, fly_time + rest_time), fly_time))
  end

  defp all_distances(line) do
    {speed, fly_time, rest_time} = parse(line)

    Enum.map(1..@end_at, fn t ->
      cycles = div(t, fly_time + rest_time)
      speed * (cycles * fly_time + min(rem(t, fly_time + rest_time), fly_time))
    end)
  end

  defp point_for_leading(reindeers) do
    Enum.map(1..@end_at, fn t ->
      distances_at_t =
        Enum.map(reindeers, fn reindeer_distances ->
          Enum.at(reindeer_distances, t - 1)
        end)

      max = Enum.max(distances_at_t)

      Enum.reduce(distances_at_t, [], fn reindeer_distance, acc ->
        point =
          case max == reindeer_distance do
            true -> 1
            false -> 0
          end

        acc ++ [point]
      end)
      |> List.to_tuple()
    end)
  end

  defp parse(line) do
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

    {speed, fly_time, rest_time}
  end

  defp unzip(list_of_tuples) do
    list_of_tuples
    |> Enum.reduce([], fn tuple, acc ->
      tuple
      |> Tuple.to_list()
      |> Enum.with_index()
      |> Enum.reduce(acc, fn {element, index}, acc ->
        if length(acc) <= index do
          acc ++ [[element]]
        else
          List.update_at(acc, index, fn sublist -> [element | sublist] end)
        end
      end)
    end)
    |> Enum.map(&Enum.reverse/1)
  end
end
