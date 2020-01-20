defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, fn x -> mapping(x) end)
  end

  def mapping(?C), do: ?G
  def mapping(?G), do: ?C
  def mapping(?A), do: ?U
  def mapping(?T), do: ?A
end
