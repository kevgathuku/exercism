defmodule WordCount do
  @regexp ~r/,|:|!|&|@|\$|%|\^|_/

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  @spec count(String.t()) :: map
  def count(sentence) do
    word_list =
      sentence
      |> String.downcase()
      |> String.replace(@regexp, " ")
      |> String.split()

    defaults = Map.new(word_list, fn x -> {x, 0} end)

    Enum.reduce(word_list, defaults, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
