defmodule SophosApp.Fibonacci_Server do
  alias SophosApp.Fibonacci
  def loop() do
    receive do
      {:sequence, caller, n} ->
        result = Fibonacci.sequence(n)
        IO.inspect(caller)
        IO.inspect(self())
        send(caller, {:fibonnacci, n, result})

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
