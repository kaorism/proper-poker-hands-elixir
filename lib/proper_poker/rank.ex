defmodule ProperPoker.Rank do
  alias ProperPoker.Pattern.{
    StraightFlush,
    FourOfAKind,
    FullHouse,
    Flush,
    Straight,
    ThreeOfAKind,
    TwoPairs,
    Pair,
    HighCard
  }

  @rank_types [
    StraightFlush,
    FourOfAKind,
    FullHouse,
    Flush,
    Straight,
    ThreeOfAKind,
    TwoPairs,
    Pair,
    HighCard
  ]

  def get_rank(cards, rank_types \\ @rank_types)

  def get_rank(cards, [head_rank_type | rest_rank_types]) do
    with {:ok, _type, _score} = result <- head_rank_type.check(cards) do
      result
    else
      :no -> get_rank(cards, rest_rank_types)
    end
  end

  def compare(left_rank, right_rank) do
    compare_rank_position(left_rank, right_rank)
  end

  defp compare_rank_position(
         {_, _, left_score} = left_rank,
         {_, _, right_score} = right_rank
       ) do
    left_rank_position = find_position(left_rank)
    right_rank_position = find_position(right_rank)

    with :tie <- compare_position(left_rank_position, right_rank_position),
         :tie <- compare_score(left_score, right_score) do
      :tie
    end
  end

  defp find_position({:ok, type, _score}) do
    Enum.find_index(@rank_types, &(&1 == type))
  end

  defp compare_position(left_rank_position, right_rank_position)
       when left_rank_position < right_rank_position,
       do: :left

  defp compare_position(left_rank_position, right_rank_position)
       when left_rank_position > right_rank_position,
       do: :right

  defp compare_position(left_rank_position, right_rank_position)
       when left_rank_position == right_rank_position,
       do: :tie

  defp compare_score([], []) do
    :tie
  end

  defp compare_score(
         [current_left_score | rest_left_scores],
         [current_right_score | rest_right_scores]
       ) do
    with :tie <- compare_score(current_left_score, current_right_score) do
      compare_score(rest_left_scores, rest_right_scores)
    end
  end

  defp compare_score(left_score, right_score) when left_score < right_score, do: :right
  defp compare_score(left_score, right_score) when left_score > right_score, do: :left
  defp compare_score(left_score, right_score) when left_score == right_score, do: :tie
end
