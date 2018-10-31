defmodule ProperPoker.Pattern.FourOfAKind do
  alias ProperPoker.Pattern.Common
  alias __MODULE__

  def check(cards) do
    with {:ok, high_score, 4} <- Common.max_same_value(cards) do
      {:ok, FourOfAKind, high_score}
    else
      _ -> :no
    end
  end
end
