defmodule ProperPoker.GameTest do
  use ExUnit.Case
  alias ProperPoker.{Game, Card}

  describe "get_result/1" do
    test "return result when given left, right cards" do
      left = [
        %Card{value: "3", suit: "D"},
        %Card{value: "4", suit: "H"},
        %Card{value: "4", suit: "S"},
        %Card{value: "9", suit: "C"},
        %Card{value: "T", suit: "C"}
      ]

      right = [
        %Card{value: "3", suit: "D"},
        %Card{value: "4", suit: "H"},
        %Card{value: "4", suit: "S"},
        %Card{value: "9", suit: "C"},
        %Card{value: "T", suit: "C"}
      ]

      assert Game.process({left, right}) == :tie
    end
  end
end
