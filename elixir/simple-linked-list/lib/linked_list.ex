defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {0, []}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push({count, store}, elem), do: {count + 1, [elem] ++ store}

  @doc """
  Counts the number of elements in a LinkedList
  """
  @spec count(t) :: non_neg_integer()
  def count({len, _}), do: len

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?({0, _}), do: true
  def empty?(_), do: false

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek({0, _}), do: {:error, :empty_list}

  def peek({_, store}) do
    {:ok, hd(store)}
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail({0, _}), do: {:error, :empty_list}

  def tail({len, store}) do
    {:ok, {len - 1, tl(store)}}
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop({0, _}), do: {:error, :empty_list}

  def pop({len, store}) do
    {:ok, hd(store), {len - 1, tl(store)}}
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list([]), do: new()

  def from_list(list), do: {Enum.count(list), list}

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list({_, store}), do: store

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse({len, store}) do
    {len, Enum.reverse(store)}
  end
end
