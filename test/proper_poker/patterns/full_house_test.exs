defmodule ProperPoker.Pattern.FullHouseTest do
  use ExUnit.Case

  alias ProperPoker.Card
  alias ProperPoker.Pattern.FullHouse

  describe "check/1" do
    test "returns FullHouse with score when there are 3 cards with the same value and 1 pair" do
      cards = [
        %Card{value: "9", suit: "D"},
        %Card{value: "9", suit: "C"},
        %Card{value: "9", suit: "S"},
        %Card{value: "3", suit: "H"},
        %Card{value: "3", suit: "H"}
      ]

      assert FullHouse.check(cards) == {:ok, FullHouse, 9}
    end

    test "returns :no when there is not same value for 3 card and 1 pair" do
      cards = [
        %Card{value: "9", suit: "D"},
        %Card{value: "9", suit: "C"},
        %Card{value: "9", suit: "S"},
        %Card{value: "2", suit: "H"},
        %Card{value: "4", suit: "H"}
      ]

      assert FullHouse.check(cards) == :no
    end
  end
end
