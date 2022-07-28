defmodule SophosApp.List do
  def countList(list) do
    count(list, 0)
  end

  defp count([], n), do: n
  defp count([_h | t], n), do: count(t, n+1)

end
