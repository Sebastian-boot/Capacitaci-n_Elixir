defmodule SophosApp.Fibonacci_Server do

  def loop() do
    receive do
      {:sequence, n} ->
        Fibonacci.sequence(n)
        |> IO.inspect()

      {:status, msg} ->
        IO.puts("Running #{inspect(msg)}")

      message ->
        IO.inspect(message)

      after
        1500 -> IO.puts("se acabó")
    end
  end
end
