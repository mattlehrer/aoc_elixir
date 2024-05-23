defmodule AdventOfCode.Day07 do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> reduce()
    |> a_or_all()
  end

  def part2(_args) do
  end

  defp a_or_all(%{"a" => a} = _map) do
    a
  end

  defp a_or_all(map) do
    map
  end

  defp reduce(lines, map \\ %{})

  defp reduce([] = _lines, map) do
    map
  end

  defp reduce(lines, map) do
    [line | rest] = lines
    [wire_input, wire_label] = String.split(line, " -> ")

    case String.split(wire_input) do
      [wire_one, "AND", wire_two] ->
        value_one = value_or_false(map, wire_one)
        value_two = value_or_false(map, wire_two)

        if value_one && value_two do
          reduce(
            rest,
            Map.put(
              map,
              wire_label,
              Bitwise.band(value_one, value_two) |> convert_to_16_bit
            )
          )
        else
          reduce(rest ++ [line], map)
        end

      [wire_one, "OR", wire_two] ->
        value_one = value_or_false(map, wire_one)
        value_two = value_or_false(map, wire_two)

        if value_one && value_two do
          reduce(
            rest,
            Map.put(
              map,
              wire_label,
              Bitwise.bor(value_one, value_two) |> convert_to_16_bit
            )
          )
        else
          reduce(rest ++ [line], map)
        end

      [wire_one, "LSHIFT", shift_amt] ->
        if Map.has_key?(map, wire_one) do
          reduce(
            rest,
            Map.put(
              map,
              wire_label,
              Bitwise.bsl(Map.get(map, wire_one), String.to_integer(shift_amt))
              |> convert_to_16_bit
            )
          )
        else
          reduce(rest ++ [line], map)
        end

      [wire_one, "RSHIFT", shift_amt] ->
        if Map.has_key?(map, wire_one) do
          reduce(
            rest,
            Map.put(
              map,
              wire_label,
              Bitwise.bsr(Map.get(map, wire_one), String.to_integer(shift_amt))
              |> convert_to_16_bit
            )
          )
        else
          reduce(rest ++ [line], map)
        end

      ["NOT", wire_one] ->
        if Map.has_key?(map, wire_one) do
          reduce(
            rest,
            Map.put(map, wire_label, Bitwise.bnot(Map.get(map, wire_one)) |> convert_to_16_bit)
          )
        else
          reduce(rest ++ [line], map)
        end

      [wire_or_amount] ->
        case Integer.parse(wire_or_amount) do
          {int, ""} ->
            reduce(rest, Map.put(map, wire_label, int |> convert_to_16_bit))

          _ ->
            if Map.has_key?(map, wire_or_amount) do
              reduce(
                rest,
                Map.put(map, wire_label, Map.get(map, wire_or_amount))
              )
            else
              reduce(rest ++ [line], map)
            end
        end

        # _ -> map
    end
  end

  defp convert_to_16_bit(integer) when is_integer(integer) do
    <<converted_int::16>> = <<integer::16>>
    converted_int
  end

  defp value_or_false(map, wire_label_or_value) do
    case Integer.parse(wire_label_or_value) do
      {int, ""} ->
        int

      _ ->
        if Map.has_key?(map, wire_label_or_value) do
          Map.get(map, wire_label_or_value)
        else
          false
        end
    end
  end
end
