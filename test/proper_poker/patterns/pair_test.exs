defmodule ProperPoker.Pattern.PairTest do
  use ExUnit.Case

  alias ProperPoker.Card
  alias ProperPoker.Pattern.Pair

  describe "check/1" do
    test "returns pair with score when there are only 2 cards with the same value" do
      cards = [
        %Card{value: "9", suit: "D"},
        %Card{value: "2", suit: "C"},
        %Card{value: "6", suit: "S"},
        %Card{value: "6", suit: "H"},
        %Card{value: "4", suit: "H"}
      ]

      assert Pair.check(cards) == {:ok, Pair, [6, 9, 4, 2]}
    end

    test "returns :no when there is no pair card values" do
      cards = [
        %Card{value: "2", suit: "D"},
        %Card{value: "3", suit: "C"},
        %Card{value: "5", suit: "S"},
        %Card{value: "8", suit: "H"},
        %Card{value: "9", suit: "H"}
      ]

      assert Pair.check(cards) == :no
    end
  end
end
