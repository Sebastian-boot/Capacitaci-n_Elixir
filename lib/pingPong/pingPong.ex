defmodule SophosApp.PingPong.PingPongServer do


  def start({module, module2}) do
    ping_pid = spawn(module, :ping, [])
    pong_pid = spawn(module2, :pong, [])
    {ping_pid, pong_pid}
  end


end
