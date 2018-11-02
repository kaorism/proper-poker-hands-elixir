defmodule ProperPoker.Pattern.TwoPairs do
  alias ProperPoker.Pattern.Common
  alias __MODULE__

  def check(cards) do
    with {:ok, [{high_score, 2}, {second_score, 2}, {low_score, 1}]} <- Common.same_value(cards) do
      {:ok, TwoPairs, [high_score, second_score, low_score]}
    else
      _ -> :no
    end
  end
end
