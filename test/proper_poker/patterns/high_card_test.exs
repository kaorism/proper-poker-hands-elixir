defmodule ProperPoker.Pattern.HighCardTest do
  use ExUnit.Case

  alias ProperPoker.Card
  alias ProperPoker.Pattern.HighCard

  describe "check/1" do
    test "returns high_card with high score" do
      cards = [
        %Card{value: "9", suit: "D"},
        %Card{value: "J", suit: "C"},
        %Card{value: "2", suit: "S"},
        %Card{value: "3", suit: "H"},
        %Card{value: "4", suit: "H"}
      ]

      assert HighCard.check(cards) == {:ok, HighCard, [11, 9, 4, 3, 2]}
    end
  end
end
