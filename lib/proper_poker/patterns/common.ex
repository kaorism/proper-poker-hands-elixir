defmodule ProperPoker.Pattern.Common do
  alias ProperPoker.Card

  def consecutive_values(cards) do
    {count, high_score} =
      cards
      |> Enum.map(&Card.get_card_score/1)
      |> Enum.sort()
      |> chunk_consecutive
      |> Enum.map(fn consecutive_values ->
        {Enum.count(consecutive_values), Enum.max(consecutive_values)}
      end)
      |> Enum.max_by(fn {count, high_score} -> count end)

    {:ok, count, high_score}
  end

  def same_suit(cards) do
    same_suit_cards =
      cards
      |> Enum.map(& &1.suit)
      |> Enum.sort()
      |> Enum.chunk_by(& &1)

    {:ok, same_suit_cards}
  end

  def max_same_suit(cards) do
    with {:ok, same_suit_cards} <- same_suit(cards) do
      num_same_suit =
        same_suit_cards
        |> Enum.map(&Enum.count/1)
        |> Enum.max()

      {:ok, num_same_suit}
    end
  end

  def same_value(cards) do
    same_value_cards =
      cards
      |> Enum.group_by(&Card.get_card_score/1)
      |> Enum.map(fn {score, cards} ->
        {score, Enum.count(cards)}
      end)
      |> Enum.sort(fn {_score1, count1}, {_score2, count2} ->
        count1 >= count2
      end)

    {:ok, same_value_cards}
  end

  def max_same_value(cards) do
    with {:ok, same_value_cards} <- same_value(cards) do
      {score, max_count} =
        same_value_cards
        |> Enum.max_by(fn {_score, cards_count} -> cards_count end)

      {:ok, score, max_count}
    end
  end

  def pair(cards) do
    cards
  end

  defp chunk_consecutive(list, current_element \\ [], acc \\ [])
  defp chunk_consecutive([head | rest], [], []), do: chunk_consecutive(rest, [head], [])

  defp chunk_consecutive([head | rest], [prev | _rest_chunk] = current_element, acc)
       when head == prev + 1,
       do: chunk_consecutive(rest, [head | current_element], acc)

  defp chunk_consecutive([head | rest], current_element, acc),
    do: chunk_consecutive(rest, [head], acc ++ [Enum.reverse(current_element)])

  defp chunk_consecutive([], current_element, acc), do: acc ++ [Enum.reverse(current_element)]
end
