defmodule AdventOfCode.Day11 do
  def part1(input) do
    input
    |> loop
  end

  def part2(input) do
    input
    |> try_next_pwd()
    |> loop()
  end

  defp loop(pwd) do
    case meets_rules?(pwd) do
      {true, pwd} ->
        pwd

      {false, pwd} ->
        try_next_pwd(pwd)
        # |> tap(&IO.inspect/1)
        |> loop
    end
  end

  defp meets_rules?(pwd) do
    pwd
    |> increasing_straight
    |> no_ambiguous_chars
    |> two_separate_pairs
  end

  defp increasing_straight(pwd) do
    bool =
      pwd
      |> String.to_charlist()
      |> to_tuples()
      |> has_increasing_triplet()

    {bool, pwd}
  end

  defp to_tuples(charlist) do
    Enum.zip([charlist, Enum.drop(charlist, 1), Enum.drop(charlist, 2)])
  end

  def has_increasing_triplet(list) do
    list
    |> Enum.any?(fn {a, b, c} -> a + 1 == b && b + 1 == c end)
  end

  defp no_ambiguous_chars({bool, pwd}) do
    if bool do
      bool =
        not Regex.match?(~r/[iol]/, pwd)

      {bool, pwd}
    else
      {false, pwd}
    end
  end

  defp two_separate_pairs({bool, pwd}) do
    if bool do
      bool =
        Regex.match?(~r/(.)\1.*(.)\2/, pwd)

      {bool, pwd}
    else
      {false, pwd}
    end
  end

  defp try_next_pwd(pwd) do
    pwd
    |> String.to_charlist()
    |> Enum.reverse()
    |> add_one
    |> Enum.reverse()
    |> to_string()
  end

  defp add_one([]), do: ""

  defp add_one([122 | tl]) do
    ~c"a" ++ add_one(tl)
  end

  defp add_one([hd | tl]) when hd < 122 do
    String.to_charlist(<<hd + 1::8>>) ++ tl
  end
end
