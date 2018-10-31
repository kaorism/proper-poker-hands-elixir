defmodule ProperPoker.Pattern.HighCard do
  alias ProperPoker.Card
  alias __MODULE__

  def check(cards) do
    highest_score =
      cards
      |> Enum.map(&Card.get_card_score/1)
      |> Enum.max()

    {:ok, HighCard, highest_score}
  end
end
