defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_ | tail]), do: tail

  def first([head | _]), do: head

  def count([]), do: 0

  def count([_ | tail]) do
    1 + count(tail)
  end

  def functional_list?([]), do: false

  def functional_list?([head | tail]) do
    if head == "Elixir" do
      true
    else
      functional_list?(tail)
    end
  end
end
