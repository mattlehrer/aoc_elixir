defmodule AdventOfCode.Day15 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_ingredient/1)
    # |> remove calories
    |> Enum.map(fn [{_, capacity}, {_, durability}, {_, flavor}, {_, texture}, _] ->
      [capacity, durability, flavor, texture]
    end)
    # |> calculate all combinations
    |> calculate_combinations()
    |> Enum.map(fn [a, b, c, d] -> a * b * c * d end)
    # # |> return max score
    |> Enum.max()
  end

  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_ingredient/1)
    # |> remove calories
    |> Enum.map(fn [{_, capacity}, {_, durability}, {_, flavor}, {_, texture}, {_, calories}] ->
      [capacity, durability, flavor, texture, calories]
    end)
    # |> calculate all combinations
    |> calculate_combinations_with_calories()
    |> Enum.map(&filter_calories(&1, 500))
    |> Enum.map(fn [a, b, c, d] -> a * b * c * d end)
    # # |> return max score
    |> Enum.max()
  end

  def parse_ingredient(line) do
    [_name, properties] = String.split(line, ": ")

    properties
    |> String.split(", ")
    |> Enum.map(&parse_property/1)
  end

  def parse_property(property) do
    [name, value] = String.split(property, " ")
    {String.to_atom(name), String.to_integer(value)}
  end

  def calculate_combinations(properties) do
    for a <- 0..100,
        b <- 0..(100 - a),
        c <- 0..(100 - a - b) do
      # for a <- 0..100 do
      #   b = 100 - a

      d = 100 - a - b - c

      #   [a, b]
      [a, b, c, d]
      |> Enum.zip(properties)
      |> Enum.map(fn {x, [capacity, durability, flavor, texture]} ->
        [x * capacity, x * durability, x * flavor, x * texture]
      end)
      |> Enum.zip()
      |> Enum.map(fn {a, b, c, d} -> [a, b, c, d] end)
      # |> Enum.map(fn {a, b} -> [a, b] end)
      |> Enum.map(fn list -> Enum.sum(list) end)
      |> Enum.map(fn value -> if value < 0, do: 0, else: value end)
    end
  end

  def calculate_combinations_with_calories(properties) do
    for a <- 0..100,
        b <- 0..(100 - a),
        c <- 0..(100 - a - b) do
      # for a <- 0..100 do
      #   b = 100 - a

      d = 100 - a - b - c

      #   [a, b]
      [a, b, c, d]
      |> Enum.zip(properties)
      |> Enum.map(fn {x, [capacity, durability, flavor, texture, calories]} ->
        [x * capacity, x * durability, x * flavor, x * texture, x * calories]
      end)
      |> Enum.zip()
      |> Enum.map(fn {a, b, c, d} -> [a, b, c, d] end)
      # |> Enum.map(fn {a, b} -> [a, b] end)
      |> Enum.map(fn list -> Enum.sum(list) end)
      |> Enum.map(fn value -> if value < 0, do: 0, else: value end)
    end
  end

  def filter_calories(list, match) do
    [a, b, c, d, calories] = list

    if calories == match do
      [a, b, c, d]
    else
      [0, 0, 0, 0]
    end
  end
end
