defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    cond do
      Enum.count(dna) == 1 ->
        {:ok, value} = Map.fetch(mapping(), to_string(dna))

        value
        |> to_charlist

      Enum.count(dna) > 1 ->
        List.to_string(dna)
        |> String.codepoints()
        |> Enum.map(fn key ->
          {:ok, value} = Map.fetch(mapping(), key)
          value
        end)
        |> Enum.join()
        |> to_charlist
    end
  end

  def mapping do
    %{"G" => "C", "C" => "G", "T" => "A", "A" => "U"}
  end
end
