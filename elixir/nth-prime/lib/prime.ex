defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  require Integer
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise("InvalidNumberError")

  def nth(count) do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.filter(&Prime.prime?(&1))
    |> Enum.at(count - 1)
  end

  def prime?(2), do: true
  def prime?(3), do: true
  def prime?(num) when num < 2, do: false
  def prime?(num) when Integer.is_even(num), do: false

  def prime?(num) do
    range_end = :math.sqrt(num) |> round

    3..range_end
    |> Enum.all?(fn x -> rem(num, x) != 0 end)
  end
end
