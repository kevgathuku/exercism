defmodule RnaTranscription do
  use Norm

  def dna(), do: spec(is_integer() and (&(&1 in 'CGAT')))
  def rna(), do: spec(is_integer() and (&(&1 in 'GCUA')))
  def to_rna(), do: spec(&Enum.all?(&1, fn x -> x in 'CGAT' end))
  def is_rna(), do: spec(&Enum.all?(&1, fn x -> x in 'GCUA' end))

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  @contract to_rna(dna :: to_rna()) :: is_rna()
  def to_rna(dna) do
    Enum.map(dna, fn x -> mapping(x) end)
  end

  @contract mapping(char :: dna()) :: rna()
  def mapping(?C), do: ?G
  def mapping(?G), do: ?C
  def mapping(?A), do: ?U
  def mapping(?T), do: ?A
end
