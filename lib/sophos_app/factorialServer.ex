defmodule SophosApp.FactorialServer do
  alias SophosApp.Factorial

  def handle_message(caller) do
    receive do
      {:compute, caller, n} ->
        result = Factorial.of(n)
        send(caller, {:fibonnacci, n, result})
        handle_message(caller)

      {:status, caller} ->
        send(caller, {:ok, caller})
        handle_message(caller)
    end
  end
end
