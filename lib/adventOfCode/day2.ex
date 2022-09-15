defmodule SophosApp.AdventOfCode.Day2 do

  def totalSquareFeet (dimensions) do

    String.split(dimensions,"\n")
    |> Enum.map(fn x -> String.split(x, "x", trim: true) end)
    |> Enum.map(fn x -> Enum.map(x,fn x ->String.to_integer(x) end)end)
    |> Enum.map(fn x -> squareFeet(x) end)
    |> Enum.sum()
  end

  defp squareFeet([l,w,h]) do
    surface = [2*l*w + 2*w*h + 2*h*l]
    slack = Enum.min([l*w,w*h,h*l])
    Enum.sum(surface) + slack
  end

  def ribbon (dimensions) do

    String.split(dimensions,"\n")
    |> Enum.map(fn x -> String.split(x, "x", trim: true) end)
    |> Enum.map(fn x -> Enum.map(x,fn x ->String.to_integer(x) end)end)
    |> Enum.map(fn x -> ribbonCalculate(x) end)
    |> Enum.sum()
  end

  defp ribbonCalculate([l,w,h]) do
    [l,w,h] = Enum.sort([l,w,h])
    ribbonLength = 2*l + 2*w
    bow = l*w*h
    ribbonLength + bow
  end

end
