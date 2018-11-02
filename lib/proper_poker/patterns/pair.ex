defmodule ProperPoker.Pattern.Pair do
  alias ProperPoker.Pattern.Common
  alias __MODULE__

  def check(cards) do
    with {:ok, [{high_score, 2}, {second_score, 1}, {third_score, 1}, {low_score, 1}]} <-
           Common.same_value(cards) do
      {:ok, Pair, [high_score, second_score, third_score, low_score]}
    else
      _ -> :no
    end
  end
end
