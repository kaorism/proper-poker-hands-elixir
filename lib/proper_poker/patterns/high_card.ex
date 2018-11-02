defmodule ProperPoker.Pattern.HighCard do
  alias ProperPoker.Card
  alias ProperPoker.Pattern.Common
  alias __MODULE__

  def check(cards) do
    with {:ok, scores} <- Common.sort_score(cards) do
      {:ok, HighCard, scores}
    end
  end
end
