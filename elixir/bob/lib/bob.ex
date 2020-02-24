defmodule Bob do
  def hey(input) do
    cond do
      upper?(input) && question?(input) && alpha?(input) ->
        "Calm down, I know what I'm doing!"

      empty?(input) ->
        "Fine. Be that way!"

      upper?(input) && alpha?(input) ->
        "Whoa, chill out!"

      question?(input) ->
        "Sure."

      true ->
        "Whatever."
    end
  end

  defp alpha?(input), do: String.upcase(input) != String.downcase(input)
  defp empty?(input), do: String.trim(input) == ""
  defp question?(input), do: input |> String.trim() |> String.last() == "?"
  defp upper?(input), do: String.upcase(input) == input
end
