defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase |> String.split() |> Enum.map(&pigify_word/1) |> Enum.join(" ")
  end

  defp pigify_word(word) do
    alphabet = for n <- ?a..?z, into: MapSet.new(), do: <<n::utf8>>

    vowels = ["a", "e", "i", "o", "u"]
    vowels_set = vowels |> MapSet.new()

    consonants = MapSet.difference(alphabet, vowels_set) |> MapSet.to_list()

    cond do
      String.starts_with?(word, vowels) ->
        word <> "ay"

      String.at(word, 0) == "x" &&
          String.slice(word, 1..-1) |> String.starts_with?(consonants) ->
        word <> "ay"

      String.at(word, 0) == "y" &&
          String.slice(word, 1..-1) |> String.starts_with?(consonants) ->
        word <> "ay"

      String.starts_with?(word, "qu") ->
        (String.slice(word, 2..-1) <> "qu") |> translate()

      String.starts_with?(word, "th") ->
        (String.slice(word, 2..-1) <> "th") |> translate()

      String.starts_with?(word, "squ") ->
        (String.slice(word, 3..-1) <> "squ") |> translate()

      String.starts_with?(word, "thr") ->
        (String.slice(word, 3..-1) <> "thr") |> translate()

      String.starts_with?(word, "sch") ->
        (String.slice(word, 3..-1) <> "sch") |> translate()

      String.starts_with?(word, consonants) ->
        (String.slice(word, 1..-1) <> String.at(word, 0)) |> translate()
    end
  end
end
