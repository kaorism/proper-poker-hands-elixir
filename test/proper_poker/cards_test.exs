defmodule ProperPoker.CardsTest do
  use ExUnit.Case
  alias ProperPoker.{Card, Cards}

  describe "to_cards/1" do
    test "returns list of cards" do
      cards_string = "3D 4H 4S 9C TC"

      assert Cards.to_cards(cards_string) == [
               %Card{value: "3", suit: "D"},
               %Card{value: "4", suit: "H"},
               %Card{value: "4", suit: "S"},
               %Card{value: "9", suit: "C"},
               %Card{value: "T", suit: "C"}
             ]
    end
  end
end
