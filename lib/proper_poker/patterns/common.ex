defmodule ProperPoker.Pattern.Common do
  alias ProperPoker.Card

  def sort_score(cards) do
    scores =
      cards
      |> Enum.map(&Card.get_card_score/1)
      |> Enum.sort()
      |> Enum.reverse()

    {:ok, scores}
  end

  def consecutive_values(cards) do
    {count, high_score} =
      cards
      |> Enum.map(&Card.get_card_score/1)
      |> Enum.sort()
      |> chunk_consecutive
      |> adjust_wheel
      |> Enum.map(&{Enum.count(&1), Enum.max(&1)})
      |> Enum.max_by(fn {count, _high_score} -> count end)

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
      |> Enum.sort(fn {score1, _count1}, {score2, _count2} ->
        score1 > score2
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

  defp chunk_consecutive(list, current_element \\ [], acc \\ [])
  defp chunk_consecutive([head | rest], [], []), do: chunk_consecutive(rest, [head], [])

  defp chunk_consecutive([head | rest], [prev | _rest_chunk] = current_element, acc)
       when head == prev + 1,
       do: chunk_consecutive(rest, [head | current_element], acc)

  defp chunk_consecutive([head | rest], current_element, acc),
    do: chunk_consecutive(rest, [head], acc ++ [Enum.reverse(current_element)])

  defp chunk_consecutive([], current_element, acc), do: acc ++ [Enum.reverse(current_element)]

  defp adjust_wheel([[2, 3, 4, 5], [14]]) do
    [[1, 2, 3, 4, 5]]
  end

  defp adjust_wheel(consecutive_cards), do: consecutive_cards
end
