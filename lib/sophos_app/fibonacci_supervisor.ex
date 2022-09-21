defmodule SophosApp.FibonacciSupervisor do
  use Supervisor
  alias SophosApp.FibonacciGenServer

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args)
  end

  def init(_args) do
    childen = [FibonacciGenServer]

    Supervisor.init(childen, strategy: :one_for_one)
  end

end
