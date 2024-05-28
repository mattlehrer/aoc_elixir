defmodule AdventOfCode.Day13 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> to_map()
    |> find_max_change()
  end

  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> to_map()
    |> add_you()
    |> find_max_change()
  end

  defp to_map(lines) do
    lines
    |> Enum.reduce(%{}, fn line, map ->
      line = String.replace(line, ".", "")

      [
        person_a,
        "would",
        gain_or_lose,
        units_string,
        "happiness",
        "units",
        "by",
        "sitting",
        "next",
        "to",
        person_b
      ] = String.split(line)

      units =
        case gain_or_lose do
          "gain" -> String.to_integer(units_string)
          "lose" -> String.to_integer(units_string) * -1
        end

      case Map.has_key?(map, person_a) do
        false -> Map.put(map, person_a, %{person_b => units})
        true -> Map.put(map, person_a, Map.merge(Map.get(map, person_a), %{person_b => units}))
      end
    end)
  end

  defp find_max_change(map) do
    arrangements = Map.keys(map) |> permute()

    Enum.reduce(arrangements, 0, fn arrangement, max_gain ->
      [hd | tl] = arrangement

      pairs = Enum.zip(arrangement, tl ++ [hd])

      score =
        Enum.reduce(pairs, 0, fn {person_a, person_b}, acc ->
          acc +
            (Map.get(map, person_a)
             |> Map.get(person_b)) +
            (Map.get(map, person_b)
             |> Map.get(person_a))
        end)

      max(score, max_gain)
    end)
  end

  defp permute([]), do: [[]]

  defp permute(list) do
    for elem <- list, rest <- permute(list -- [elem]), do: [elem | rest]
  end

  defp add_you(map) do
    people = Map.keys(map)
    map = Map.put(map, :you, %{})

    Enum.reduce(people, map, fn person, acc ->
      acc = Map.put(acc, person, Map.merge(Map.get(acc, person), %{:you => 0}))
      Map.put(acc, :you, Map.merge(Map.get(acc, :you), %{person => 0}))
    end)
  end
end
