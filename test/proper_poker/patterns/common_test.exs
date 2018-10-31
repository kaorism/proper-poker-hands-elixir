defmodule ProperPoker.Pattern.CommonTest do
  use ExUnit.Case

  alias ProperPoker.Card
  alias ProperPoker.Pattern.Common

  describe "consecutive_values/2" do
    test "return num of consecutive values, high score when all values are consecutive value" do
      cards = [
        %Card{value: "9", suit: "H"},
        %Card{value: "T", suit: "H"},
        %Card{value: "J", suit: "H"},
        %Card{value: "Q", suit: "H"},
        %Card{value: "K", suit: "H"}
      ]

      result = Common.consecutive_values(cards)

      assert result == {:ok, 5, 13}
    end

    test "return num of consecutive value, high score when not all values are consecutive value" do
      cards = [
        %Card{value: "9", suit: "H"},
        %Card{value: "T", suit: "H"},
        %Card{value: "J", suit: "H"},
        %Card{value: "5", suit: "H"},
        %Card{value: "K", suit: "H"},
        %Card{value: "A", suit: "H"}
      ]

      result = Common.consecutive_values(cards)

      assert result == {:ok, 3, 11}
    end
  end

  describe "max_same_suit/1" do
    test "returns number of suit when all are same suit" do
      cards = [
        %Card{value: "9", suit: "H"},
        %Card{value: "T", suit: "H"},
        %Card{value: "A", suit: "H"},
        %Card{value: "Q", suit: "H"},
        %Card{value: "K", suit: "H"}
      ]

      result = Common.max_same_suit(cards)

      assert result == {:ok, 5}
    end

    test "returns number of suit when not all suit as same" do
      cards = [
        %Card{value: "9", suit: "H"},
        %Card{value: "T", suit: "S"},
        %Card{value: "A", suit: "H"},
        %Card{value: "Q", suit: "H"},
        %Card{value: "K", suit: "H"}
      ]

      result = Common.max_same_suit(cards)

      assert result == {:ok, 4}
    end
  end

  describe "same_value/1" do
    test "returns number of value are same" do
      cards = [
        %Card{value: "5", suit: "H"},
        %Card{value: "4", suit: "S"},
        %Card{value: "4", suit: "C"},
        %Card{value: "4", suit: "H"},
        %Card{value: "7", suit: "H"}
      ]

      result = Common.same_value(cards)

      assert result == {:ok, [{4, 3}, {5, 1}, {7, 1}]}
    end
  end
end
