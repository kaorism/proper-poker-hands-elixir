defmodule ProperPoker.CardTest do
  use ExUnit.Case

  alias ProperPoker.Card

  describe "to_card/1" do
    test "returns card struct" do
      result = Card.to_card("2D")

      assert result == %Card{value: "2", suit: "D"}
    end

    test "returns card struct with string denoted value" do
      assert Card.to_card("TD") == %Card{value: "T", suit: "D"}
    end
  end

  describe "get_card_score/1" do
    test "return score when value is number string " do
      result = Card.get_card_score(%Card{value: "6", suit: "D"})

      assert result == 6
    end

    test "return score when value is denoted string " do
      result = Card.get_card_score(%Card{value: "T", suit: "D"})

      assert result == 10
    end
  end
end
