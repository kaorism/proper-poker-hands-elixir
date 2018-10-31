defmodule ProperPoker.Pattern.FourOfAKindTest do
  use ExUnit.Case

  alias ProperPoker.Card
  alias ProperPoker.Pattern.FourOfAKind

  describe "check/1" do
    test "returns four_of_a_kind with score when there are 4 cards with the same value" do
      cards = [
        %Card{value: "9", suit: "D"},
        %Card{value: "9", suit: "C"},
        %Card{value: "9", suit: "S"},
        %Card{value: "9", suit: "H"},
        %Card{value: "4", suit: "H"}
      ]

      assert FourOfAKind.check(cards) == {:ok, FourOfAKind, 9}
    end

    test "returns :no when there is not same 4 card values" do
      cards = [
        %Card{value: "9", suit: "D"},
        %Card{value: "9", suit: "C"},
        %Card{value: "9", suit: "S"},
        %Card{value: "2", suit: "H"},
        %Card{value: "4", suit: "H"}
      ]

      assert FourOfAKind.check(cards) == :no
    end
  end
end
