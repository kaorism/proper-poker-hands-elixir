defmodule ProperPoker.Pattern.StraightFlush do
  alias ProperPoker.Card
  alias ProperPoker.Pattern.Common
  alias __MODULE__

  def check(cards) do
    with {:ok, 5} <- Common.max_same_suit(cards),
         {:ok, 5, high_score} <- Common.consecutive_values(cards) do
      {:ok, StraightFlush, high_score}
    else
      _ -> :no
    end
  end
end
