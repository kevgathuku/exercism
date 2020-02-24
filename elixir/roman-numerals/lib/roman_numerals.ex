defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    convert(number)
  end

  def convert(num) when num >= 1000, do: "M" <> convert(num - 1000)
  def convert(num) when num >= 900, do: "CM" <> convert(num - 900)
  def convert(num) when num >= 500, do: "D" <> convert(num - 500)
  def convert(num) when num >= 400, do: "CD" <> convert(num - 400)
  def convert(num) when num >= 100, do: "C" <> convert(num - 100)
  def convert(num) when num >= 90, do: "XC" <> convert(num - 90)
  def convert(num) when num >= 50, do: "L" <> convert(num - 50)
  def convert(num) when num >= 40, do: "XL" <> convert(num - 40)
  def convert(num) when num >= 10, do: "X" <> convert(num - 10)
  def convert(num) when num >= 9, do: "IX" <> convert(num - 9)
  def convert(num) when num >= 5, do: "V" <> convert(num - 5)
  def convert(num) when num >= 4, do: "IV" <> convert(num - 4)
  def convert(num) when num >= 1, do: "I" <> convert(num - 1)
  def convert(0), do: ""
end
