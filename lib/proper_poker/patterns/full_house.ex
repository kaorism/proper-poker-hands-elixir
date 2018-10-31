defmodule ProperPoker.Pattern.FullHouse do
  alias ProperPoker.Card
  alias ProperPoker.Pattern.Common
  alias __MODULE__

  def check(cards) do
    with {:ok, [{high_score, 3}, {low_score, 2}]} <- Common.same_value(cards) do
      {:ok, FullHouse, high_score}
    else
      _ -> :no
    end
  end
end
