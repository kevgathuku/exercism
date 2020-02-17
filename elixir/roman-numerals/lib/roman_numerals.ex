defmodule RomanNumerals do
  @mapping %{
             1 => "I",
             4 => "IV",
             5 => "V",
             9 => "IX",
             10 => "X",
             40 => "XL",
             50 => "L",
             90 => "XC",
             100 => "C",
             400 => "CD",
             500 => "D",
             900 => "CM",
             1000 => "M"
           }
           |> Enum.to_list()
           |> Enum.reverse()

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    get_numeral(number, "")
  end

  defp get_numeral(0, acc), do: acc

  defp get_numeral(number, acc) do
    {candidate, roman} =
      @mapping
      |> Enum.find(fn {x, _roman} -> div(number, x) >= 1 end)

    get_numeral(number - candidate, acc <> roman)
  end
end
