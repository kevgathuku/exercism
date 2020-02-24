defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  require Integer
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise("InvalidNumberError")

  def nth(count) do
    1..(count * 100)
    |> Enum.map(fn x ->
      if prime?(x) do
        x
      end
    end)
    |> Enum.reject(&is_nil/1)
    # convert the count to zero index
    |> Enum.at(count - 1)
  end

  def prime?(2), do: true
  def prime?(3), do: true
  def prime?(num) when num < 2, do: false
  def prime?(num) when Integer.is_even(num), do: false

  def prime?(num) do
    range_end = :math.sqrt(num) |> round

    3..range_end
    |> Enum.reject(&Integer.is_even(&1))
    |> Enum.filter(fn x -> rem(num, x) == 0 end)
    |> Enum.empty?()
  end
end
