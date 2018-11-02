defmodule ProperPoker.Pattern.StraightTest do
  use ExUnit.Case

  alias ProperPoker.Pattern.Straight
  alias ProperPoker.Card

  describe "check/1" do
    test "return straight when number of consecutive value equals 5" do
      cards = [
        %Card{value: "9", suit: "H"},
        %Card{value: "T", suit: "C"},
        %Card{value: "J", suit: "D"},
        %Card{value: "Q", suit: "S"},
        %Card{value: "K", suit: "H"}
      ]

      assert Straight.check(cards) == {:ok, Straight, 13}
    end

    test "return no when number of consecutive value 5" do
      cards = [
        %Card{value: "9", suit: "H"},
        %Card{value: "T", suit: "D"},
        %Card{value: "A", suit: "C"},
        %Card{value: "Q", suit: "S"},
        %Card{value: "K", suit: "D"}
      ]

      assert Straight.check(cards) == :no
    end
  end
end
