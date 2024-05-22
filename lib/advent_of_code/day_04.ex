defmodule AdventOfCode.Day04 do
  def part1(input) do
    Enum.reduce_while(1..1_000_000_000_000, 0, fn i, acc ->
      hash = :crypto.hash(:md5, input <> Integer.to_string(i)) |> Base.encode16(case: :lower)

      if hash =~ ~r/^00000/ do
        {:halt, i}
      else
        {:cont, acc}
      end
    end)

    # this benchmarks as a bit slower than Enum.reduce_while
    # try do
    #   for i <- 1..1_000_000_000_000 do
    #     hash = :crypto.hash(:md5, input <> Integer.to_string(i)) |> Base.encode16(case: :lower)

    #     if hash =~ ~r/^00000/ do
    #       throw(i)
    #     end
    #   end
    # catch
    #   i -> i
    # end
  end

  def part2(input) do
    Enum.reduce_while(1..1_000_000_000_000, 0, fn i, acc ->
      hash = :crypto.hash(:md5, input <> Integer.to_string(i)) |> Base.encode16(case: :lower)

      if hash =~ ~r/^000000/ do
        {:halt, i}
      else
        {:cont, acc}
      end
    end)
  end
end
