defmodule ProperPokerTest do
  use ExUnit.Case
  doctest ProperPoker

  alias PokerHands

  describe "vs/2" do
    test "returns same result as original" do
      assert ProperPoker.vs("2H 3D 5S 9C KD", "2C 3H 4S 8C KH") ==
               PokerHands.vs("2H 3D 5S 9C KD", "2C 3H 4S 8C KH")
    end
  end
end
