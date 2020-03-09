defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten([]), do: []
  def flatten(nil), do: []

  def flatten([head | tail]) do
    # Reduces the list (even nested ones) to a flat list
    # e.g. [0] + [1] + [2] + [nil] + []
    flatten(head) ++ flatten(tail)
  end

  def flatten(head), do: [head]
end
