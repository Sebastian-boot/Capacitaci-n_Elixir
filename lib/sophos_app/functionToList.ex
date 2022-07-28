defmodule SophosApp.FunctionToList do

  def squareList(list) do
    square(list, [])
  end

  defp square([], n), do: n
  defp square([h | t], n), do: square(t, n ++ [h*h])
end
