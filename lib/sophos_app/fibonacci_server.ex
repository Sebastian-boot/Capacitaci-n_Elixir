defmodule SophosApp.Fibonacci_Server do
  alias SophosApp.Fibonacci

  def handle_message({:sequence, n}, caller, state) do
    {:ok, Fibonacci.sequence(n), state + 1}
  end
  def handle_message({:status}, caller, state) do
    {:ok, state, state}
  end
end
