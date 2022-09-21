defmodule SophosApp.PingPong.PingPongServer do
  def start({module, module2}) do
    ping_pid = spawn(module, :ping, [])
    pong_pid = spawn(module2, :pong, [])
    {ping_pid, pong_pid}
  end

  # Pin Pong Distribuido
  def startInNode1(module) do
    ping_pid = spawn(module, :ping, [])
    ping_pid
  end

  def startInNode2(module) do
    pong_pid = spawn(module, :pong, [])
    pong_pid
  end

end
