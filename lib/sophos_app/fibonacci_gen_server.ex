defmodule SophosApp.FibonacciGenServer do

  alias SophosApp.Fibonacci

  use GenServer

  def init(init_arg) do
    {:ok, init_arg}
  end

  def handle_call({:sequence, n}, _from, state) do
    result =
      state
      |> Map.fetch(n)
      |> case do
        {:ok, r} -> r
        :error -> Fibonacci.sequence(n)
      end

    new_state = Map.put_new(state, n, result)

    {:reply, result, new_state}
  end

  def handle_call(:status, _from, state) do
    {:reply, state, state}
  end

  #def handle_cast({:sequence, n}, state) do
  #  result= Fibonacci.sequence(n)
  #  {:noreply, [result | state]}
  #end

end
