defmodule ProperPoker.Pattern.TwoPairsTest do
  use ExUnit.Case

  alias ProperPoker.Card
  alias ProperPoker.Pattern.TwoPairs

  describe "check/1" do
    test "returns two_pairs with score when there are 2 set of pairs" do
      cards = [
        %Card{value: "9", suit: "D"},
        %Card{value: "9", suit: "C"},
        %Card{value: "6", suit: "S"},
        %Card{value: "6", suit: "H"},
        %Card{value: "4", suit: "H"}
      ]

      assert TwoPairs.check(cards) == {:ok, TwoPairs, [9, 6, 4]}
    end

    test "returns :no when there is not 2 set of pairs" do
      cards = [
        %Card{value: "9", suit: "D"},
        %Card{value: "9", suit: "C"},
        %Card{value: "5", suit: "S"},
        %Card{value: "2", suit: "H"},
        %Card{value: "4", suit: "H"}
      ]

      assert TwoPairs.check(cards) == :no
    end
  end
end
