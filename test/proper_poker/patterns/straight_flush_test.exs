defmodule ProperPoker.Pattern.StraightFlushTest do
  use ExUnit.Case

  alias ProperPoker.Pattern.StraightFlush
  alias ProperPoker.Card

  describe "check/1" do
    test "return straight_flush when number of consecutive value equals 5 and same suit" do
      cards = [
        %Card{value: "9", suit: "H"},
        %Card{value: "T", suit: "H"},
        %Card{value: "J", suit: "H"},
        %Card{value: "Q", suit: "H"},
        %Card{value: "K", suit: "H"}
      ]

      assert StraightFlush.check(cards) == {:ok, StraightFlush, 13}
    end

    test "return true when number of consecutive value not equal" do
      cards = [
        %Card{value: "9", suit: "H"},
        %Card{value: "T", suit: "H"},
        %Card{value: "A", suit: "H"},
        %Card{value: "Q", suit: "H"},
        %Card{value: "K", suit: "H"}
      ]

      assert StraightFlush.check(cards) == :no
    end
  end
end
