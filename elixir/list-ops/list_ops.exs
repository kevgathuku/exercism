defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  # Private function. Can only be invoked locally
  @spec foldl(list, acc, ((any, acc) -> acc)) :: acc
  defp foldl([head | tail], acc, f) do
    foldl(tail, f.(head, acc), f)
  end

  defp foldl([], acc, _f) do
    acc
  end

  @spec count(list) :: non_neg_integer
  def count(l) do
    foldl(l, 0, fn(_, acc) -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    foldl(l, [], fn(el, acc) -> [el | acc] end)
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    foldl(reverse(l), [], fn(el, acc) -> [f.(el) | acc] end)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    foldl(reverse(l), [], fn(el, acc) -> if f.(el) == true do [el | acc] else acc end end)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    foldl(l, acc, fn(el, acc) -> f.(el, acc) end)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    foldl(reverse(a), b, fn(el, acc) -> [el | acc] end)
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    foldl(reverse(ll), [], fn(el, acc) -> append(el, acc) end)
  end
end
