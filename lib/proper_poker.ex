defmodule ProperPoker do
  @moduledoc """
  Documentation for ProperPoker.
  """
  alias ProperPoker.{Game, Cards}

  def vs(left_hand, right_hand) do
    left_cards = left_hand |> Cards.to_cards()
    right_cards = right_hand |> Cards.to_cards()

    {left_cards, right_cards}
    |> Game.process()
    |> format_result()
  end

  def format_result(:left), do: "Left wins!"
  def format_result(:tie), do: "Tie!"
  def format_result(:right), do: "Right wins!"
end
