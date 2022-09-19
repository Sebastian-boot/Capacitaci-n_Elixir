defmodule SophosApp.Fibonacci_Server do
  alias SophosApp.Fibonacci

  def start() do
    spawn(__MODULE__, :loop, [] )
  end

  def start_link() do
    spawn_link(__MODULE__, :loop, [])
  end

  def start_link() do
    spawn_monitor(__MODULE__, :loop, [])
  end

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

      _message ->
        IO.puts("Bad Operations")
        loop()

      #after
      #  1500 -> IO.puts("se acabó")
    end
  end
end
