defmodule SophosApp.AdventOfCode.Day3 do
  def countHouses(instructions) do

    String.split(instructions, "")
    |> translateInstructions()
    |> move()
    |> Enum.uniq()
    |> Enum.count()
  end

  defp translateInstructions(instructions) do
    instructions
    Enum.map(instructions, fn
      "" -> [0,0]
      "^" -> [0,1]
      "v" -> [0,-1]
      ">" -> [1,0]
      "<" -> [-1,0]
    end)
  end

  defp move(route) do
    Enum.scan(route, fn ([x,y], [z,w]) -> [x+z,y+w] end)
  end

  def countWithRoboSanta(instructions) do
    String.split(instructions, "")
    |> translateInstructions()
    |> movingWithRoboSanta()
    |>Enum.uniq()
    |>Enum.count()
  end

  defp movingWithRoboSanta(instructions) do
    santaRoute = (
        instructions
        |> Enum.with_index()
        |> Enum.map(fn {num,index} ->
          cond do
            rem(index, 2) == 1 -> num
            :true -> ""
          end
        end)
        |> Enum.filter(fn x -> x != "" end)
      )

      roboSantaRoute = (
        instructions
        |> Enum.with_index()
        |> Enum.map(fn {num,index} ->
          cond do
            rem(index, 2) == 0 -> num
            :true -> ""
          end
        end)
        |> Enum.filter(fn x -> x != "" end)
      )

      santaMove = move(santaRoute)
      roboSantaMove = move(roboSantaRoute)

      Enum.concat(santaMove,roboSantaMove)
  end





end
