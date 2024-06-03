defmodule AdventOfCode.Day16 do
  @ticker %{
    children: 3,
    cats: 7,
    samoyeds: 2,
    pomeranians: 3,
    akitas: 0,
    vizslas: 0,
    goldfish: 5,
    trees: 3,
    cars: 2,
    perfumes: 1
  }

  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_sue/1)
    |> Enum.find(&is_sue/1)
    |> elem(0)
  end

  def part2(_args) do
  end

  def parse_sue(line) do
    [sue, properties] = String.split(line, ": ", parts: 2)

    ["Sue", number] = String.split(sue, " ")

    properties
    |> String.split(", ")
    |> Enum.map(&parse_property/1)
    |> Enum.into(%{})
    |> (fn map -> {String.to_integer(number), map} end).()
  end

  def parse_property(property) do
    [key, value] = String.split(property, ": ")
    {String.to_atom(key), String.to_integer(value)}
  end

  def is_sue({_, properties}) do
    Enum.all?(properties, fn {key, value} -> Map.get(@ticker, key) == value end)
  end
end
