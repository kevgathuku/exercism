defmodule Bob do
  def hey(input) do
    cond do
      is_upper(input) && is_question(input) && is_alpha(input) ->
        "Calm down, I know what I'm doing!"

      is_empty(input) ->
        "Fine. Be that way!"

      is_upper(input) && is_alpha(input) ->
        "Whoa, chill out!"

      is_question(input) ->
        "Sure."

      true ->
        "Whatever."
    end
  end

  defp is_alpha(input), do: String.match?(input, ~r/[[:alpha:]]/)
  defp is_empty(input), do: String.trim(input) == ""
  defp is_question(input), do: input |> String.trim() |> String.last() == "?"
  defp is_upper(input), do: String.upcase(input) == input
end
