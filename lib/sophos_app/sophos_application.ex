defmodule SophosApp.Application do
  use Supervisor

  def start(_type, _args) do
    SophosApp.FibonacciSupervisor.start_link([])
  end


end
