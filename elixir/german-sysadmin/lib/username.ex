defmodule Username do
  @allowed_characters ~c"_abcdefghijklmnopqrstuvwxyz"

  def sanitize(username) when length(username) == 0, do: username

  def sanitize(username) do
    Enum.reduce(username, ~c"", fn char, acc ->
      acc ++
        case char do
          x when x in @allowed_characters -> [x]
          ?ä -> ~c"ae"
          ?ö -> ~c"oe"
          ?ü -> ~c"ue"
          ?ß -> ~c"ss"
          _ -> ~c""
        end
    end)
  end
end
