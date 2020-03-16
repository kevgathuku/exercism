defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  require Integer

  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input)
      when is_binary(input)
      when input <= 0,
      do: raise(FunctionClauseError)

  def calc(input) do
    collatz(input, 0)
  end

  defp collatz(1, acc), do: acc

  defp collatz(input, acc) do
    cond do
      Integer.is_even(input) ->
        collatz(div(input, 2), acc + 1)

      Integer.is_odd(input) ->
        collatz(input * 3 + 1, acc + 1)
    end
  end
end
