defmodule SophosApp.FizzBuzz do
  alias SophosApp.MyList

  def start(n) do
    MyList.generate(n)
    |> run()
  end

  defp  run(list) do
    run(list, [])
  end


  defp run([], list), do: list
  defp run([h | t], list) when rem(h,15) == 0, do: run(t, list ++ [:FizzBuzz])
  defp run([h | t], list) when rem(h,3) == 0, do: run(t, list ++ [:Fizz])
  defp run([h | t], list) when rem(h,5) == 0, do: run(t, list ++ [:Buzz])
  defp run([h | t], list), do: run(t,list++[h])


end
