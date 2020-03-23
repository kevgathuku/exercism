defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base_frequencies = to_frequencies_map(base)

    candidates
    # remove exact duplicates
    |> Enum.filter(fn x -> String.downcase(x) != String.downcase(base) end)
    |> Enum.filter(fn x -> base_frequencies == to_frequencies_map(x) end)
  end

  # Converts `str` to a map of character frequencies  
  defp to_frequencies_map(str) do
    String.downcase(str) |> String.to_charlist() |> Enum.frequencies()
  end
end
