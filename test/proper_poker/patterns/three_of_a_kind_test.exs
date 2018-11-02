defmodule ProperPoker.Pattern.ThreeOfAKindTest do
  use ExUnit.Case

  alias ProperPoker.Card
  alias ProperPoker.Pattern.ThreeOfAKind

  describe "check/1" do
    test "returns three_of_a_kind with score when there are 3 cards with the same value" do
      cards = [
        %Card{value: "9", suit: "D"},
        %Card{value: "9", suit: "C"},
        %Card{value: "9", suit: "S"},
        %Card{value: "6", suit: "H"},
        %Card{value: "4", suit: "H"}
      ]

      assert ThreeOfAKind.check(cards) == {:ok, ThreeOfAKind, 9}
    end

    test "returns :no when there is not same 3 card values" do
      cards = [
        %Card{value: "9", suit: "D"},
        %Card{value: "9", suit: "C"},
        %Card{value: "5", suit: "S"},
        %Card{value: "2", suit: "H"},
        %Card{value: "4", suit: "H"}
      ]

      assert ThreeOfAKind.check(cards) == :no
    end
  end
end
