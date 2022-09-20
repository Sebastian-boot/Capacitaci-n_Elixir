defmodule SophosApp.Fibonacci_Server do
  alias SophosApp.Fibonacci

  def handle_message({:sequence, n}, caller) do
        result = Fibonacci.sequence(n)
        send(caller, {:fibonnacci, n, result})
  end
  def handle_message({:status}, caller) do
        send(caller, {:ok, caller})
  end
end
