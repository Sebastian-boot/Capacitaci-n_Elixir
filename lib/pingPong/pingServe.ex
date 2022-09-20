defmodule  SophosApp.PingPong.PingServe do

  def ping do
    receive do
      {sender, :pong} ->
        IO.puts("PID #{inspect(sender)}, Pong")
        :timer.sleep(1000)
        send sender, {self(), :ping}
    end
    ping()
  end

end
