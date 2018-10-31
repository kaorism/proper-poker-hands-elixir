defmodule ProperPokerTest do
  use ExUnit.Case
  use ExUnitProperties

  doctest ProperPoker

  alias PokerHands

  describe "vs/2" do
    test "returns same result as original" do
      assert ProperPoker.vs("2H 3D 5S 7C 8D", "2C 3H 5S 8C KH") ==
               PokerHands.vs("2H 3D 5S 9C 8D", "2C 3H 5S 8C KH")
    end

    test "Left has Full house" do
      left = "2D 2H 2S 3C 3D"
      right = "2C 3H 3S 4C 4D"

      assert ProperPoker.vs(left, right) == PokerHands.vs(left, right)
    end

    property "always return same result as original" do
      check all picked_cards <- StreamData.uniq_list_of(StreamData.member_of(deck()), length: 10) do
        [left_hand_cards, right_hand_cards] = Enum.chunk_every(picked_cards, 5)
        left_hand = left_hand_cards |> Enum.join(" ")
        right_hand = right_hand_cards |> Enum.join(" ")

        assert ProperPoker.vs(left_hand, right_hand) == PokerHands.vs(left_hand, right_hand)
      end
    end
  end

  defp deck do
    suits = ["C", "D", "H", "S"]
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]

    for value <- values, suit <- suits, do: value <> suit
  end
end
