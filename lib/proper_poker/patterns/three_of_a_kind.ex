defmodule ProperPoker.Pattern.ThreeOfAKind do
  alias ProperPoker.Pattern.Common
  alias __MODULE__

  def check(cards) do
    with {:ok, [{high_score, 3}, {_, 1}, {_, 1}]} <- Common.same_value(cards) do
      {:ok, ThreeOfAKind, high_score}
    else
      _ -> :no
    end
  end
end
