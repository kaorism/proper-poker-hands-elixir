defmodule ProperPoker.Cards do
  alias ProperPoker.Card

  def to_cards(card_string) do
    card_string
    |> String.split(" ")
    |> Enum.map(&Card.to_card/1)
  end
end
