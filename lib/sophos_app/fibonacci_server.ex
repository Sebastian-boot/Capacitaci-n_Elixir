defmodule SophosApp.Fibonacci_Server do
  alias SophosApp.Fibonacci

  def start() do
    spawn(__MODULE__, :loop, [0] )
  end

  def start_link() do
    spawn_link(__MODULE__, :loop, [0])
  end

  def start_link() do
    spawn_monitor(__MODULE__, :loop, [0])
  end

  def loop(counter) do
    receive do
      {:sequence, caller, n} ->
        result = Fibonacci.sequence(n)
        send(caller, {:fibonnacci, n, result})

        loop(counter + 1)

      {:status, caller} ->
        send(caller, {:ok, counter})
        loop(counter)

      {:exit, reason} ->
        IO.puts("bye for #{inspect(reason)}")

      _message ->
        IO.puts("Bad Operations")
        loop(counter)

      #after
      #  1500 -> IO.puts("se acabó")
    end
  end
end
