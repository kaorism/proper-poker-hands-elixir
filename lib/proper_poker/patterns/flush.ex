defmodule ProperPoker.Pattern.Flush do
  alias ProperPoker.Card
  alias ProperPoker.Pattern.Common
  alias __MODULE__

  def check(cards) do
    with {:ok, 5} <- Common.max_same_suit(cards),
         {:ok, scores} <- Common.sort_score(cards) do
      {:ok, Flush, scores}
    else
      _ -> :no
    end
  end
end
