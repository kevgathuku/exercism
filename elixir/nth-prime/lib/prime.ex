defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  require Integer
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise("InvalidNumberError")

  def nth(count) do
    # Set the upper limit to some large number. Hopefully we don't reach it
    # before finding `count` prime numbers
    Enum.reduce_while(1..134_217_728, [], fn x, primes ->
      # Keep accumulating until we get `count` items
      if Enum.count(primes) < count do
        if Prime.prime?(x) do
          {:cont, [x | primes]}
        else
          {:cont, primes}
        end
      else
        {:halt, primes}
      end
    end)
    # Get the nth last element, since we built the primes list
    # in reverse
    |> Enum.at(-count)
  end

  def prime?(2), do: true
  def prime?(3), do: true
  def prime?(num) when num < 2, do: false
  def prime?(num) when Integer.is_even(num), do: false

  def prime?(num) do
    range_end = :math.sqrt(num) |> round

    3..range_end
    |> Enum.reject(&Integer.is_even(&1))
    |> Enum.all?(fn x -> rem(num, x) != 0 end)
  end
end
