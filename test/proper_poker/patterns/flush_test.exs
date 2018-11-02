defmodule ProperPoker.Pattern.FlushTest do
  use ExUnit.Case

  alias ProperPoker.Pattern.Flush
  alias ProperPoker.Card

  describe "check/1" do
    test "returns flush when 5 cards have same suit" do
      cards = [
        %Card{value: "9", suit: "H"},
        %Card{value: "T", suit: "H"},
        %Card{value: "4", suit: "H"},
        %Card{value: "Q", suit: "H"},
        %Card{value: "7", suit: "H"}
      ]

      assert Flush.check(cards) == {:ok, Flush, [12, 10, 9, 7, 4]}
    end

    test "return no when 5 cards have 1 different suit" do
      cards = [
        %Card{value: "9", suit: "H"},
        %Card{value: "T", suit: "H"},
        %Card{value: "A", suit: "D"},
        %Card{value: "Q", suit: "H"},
        %Card{value: "K", suit: "H"}
      ]

      assert Flush.check(cards) == :no
    end
  end
end
