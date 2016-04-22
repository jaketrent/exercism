defmodule Teenager do
  def hey(input) do
    cond do
      String.upcase(input) == input ->
        "Woah, chill out!"
      String.at(input, -1) == "?" ->
        "Sure."
      true ->
        "Whatever."
    end
  end
end
