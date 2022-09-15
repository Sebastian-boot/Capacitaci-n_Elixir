defmodule SophosApp.AdventOfCode.Day1 do
  """
  Start 1
  """
  def findFloor(steps) do
      String.split(steps,"")
      |> calculateFloor()
      |> Enum.sum()
  end

  defp calculateFloor(steps) do
    Enum.map(steps, fn
      "" -> 0
      ")" -> -1
      "(" -> 1
    end)
  end

  """
  Start 1
  """
  def findPosition(steps) do
    String.split(steps,"")
    |> calculateFloor()
    |> sum(0,-1)
  end

  defp sum([h | t], acc, index) when acc != -1, do: sum(t, acc + h, index + 1)
  defp sum(list, acc, index) when list == [] or acc == -1, do: index

end
