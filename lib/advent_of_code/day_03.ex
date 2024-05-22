defmodule AdventOfCode.Day03 do
  def part1(input) do
    input
    |> String.trim()
    |> String.graphemes()
    |> move()
    |> Enum.uniq()
    |> Enum.count()
  end

  def part2(input) do
    moves =
      input
      |> String.trim()
      |> String.graphemes()

    santas_stops =
      moves
      |> Enum.take_every(2)
      |> move()
      |> Enum.uniq()

    robo_santas_stops =
      moves
      |> Enum.drop_every(2)
      |> move()
      |> Enum.uniq()

    (santas_stops ++ robo_santas_stops)
    |> Enum.uniq()
    |> Enum.count()
  end

  defp move(moves_list) do
    moves_list
    |> Enum.reduce([{0, 0}], fn direction, [{x, y} | tl] ->
      case direction do
        ">" -> [{x + 1, y} | [{x, y} | tl]]
        "<" -> [{x - 1, y} | [{x, y} | tl]]
        "^" -> [{x, y + 1} | [{x, y} | tl]]
        "v" -> [{x, y - 1} | [{x, y} | tl]]
      end
    end)
  end
end
