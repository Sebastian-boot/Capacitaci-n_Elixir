defmodule SophosApp.Fibonacci_Server do

  def loop() do
    receive do
      {:sequence, n} ->
        Fibonacci.sequence(n)
        |> IO.inspect()

        loop()

      {:status, msg} ->
        IO.puts("Running #{inspect(msg)}")

        loop()

      {:exit, reason} ->
        IO.puts("bye for #{inspect(reason)}")

      message ->
        IO.inspect(message)
        loop()

      #after
      #  1500 -> IO.puts("se acabó")
    end
  end
end
