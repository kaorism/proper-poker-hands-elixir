defmodule ProperPoker.RankTest do
  use ExUnit.Case
  alias ProperPoker.{Rank, Card}
  alias ProperPoker.Pattern.{StraightFlush, FourOfAKind, HighCard}

  describe "get_rank/1" do
    test "returns straight flush when got 5 cards of the same suit with consecutive values" do
      cards = [
        %Card{value: "9", suit: "H"},
        %Card{value: "T", suit: "H"},
        %Card{value: "J", suit: "H"},
        %Card{value: "Q", suit: "H"},
        %Card{value: "K", suit: "H"}
      ]

      assert Rank.get_rank(cards) == {:ok, StraightFlush, 13}
    end
  end

  describe "compare/1" do
    test "returns right when right win with different pattern" do
      left_rank = {:ok, HighCard, 12}
      right_rank = {:ok, StraightFlush, 12}

      assert Rank.compare(left_rank, right_rank) == :right
    end

    test "returns left when left win with different pattern" do
      left_rank = {:ok, StraightFlush, 12}
      right_rank = {:ok, FourOfAKind, 12}

      assert Rank.compare(left_rank, right_rank) == :left
    end

    test "returns tie when no one win with the same pattern" do
      left_rank = {:ok, FourOfAKind, 3}
      right_rank = {:ok, FourOfAKind, 3}

      assert Rank.compare(left_rank, right_rank) == :tie
    end

    test "returns right when right win with same pattern but different score" do
      left_rank = {:ok, HighCard, 2}
      right_rank = {:ok, HighCard, 9}

      assert Rank.compare(left_rank, right_rank) == :right
    end

    test "returns left when left win with same pattern but different score" do
      left_rank = {:ok, HighCard, 12}
      right_rank = {:ok, HighCard, 9}

      assert Rank.compare(left_rank, right_rank) == :left
    end
  end
end
