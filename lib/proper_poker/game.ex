defmodule ProperPoker.Game do
  alias ProperPoker.{Card, Rank}

  def process(player_cards) do
    [left_rank, right_rank] =
      player_cards
      |> Tuple.to_list()
      |> Enum.map(&Rank.get_rank/1)

    Rank.compare(left_rank, right_rank)
  end
end
