defmodule ProperPoker.Card do
  defstruct [:value, :suit]

  alias __MODULE__

  def to_card(card_string) do
    [value, suit] = String.codepoints(card_string)

    %Card{value: value, suit: suit}
  end

  def get_card_score(%__MODULE__{value: value}) do
    get_score(value)
  end

  defp get_score("T"), do: 10
  defp get_score("J"), do: 11
  defp get_score("Q"), do: 12
  defp get_score("K"), do: 13
  defp get_score("A"), do: 14
  defp get_score(number_string), do: String.to_integer(number_string)
end
