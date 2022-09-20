defmodule SophosApp.PingPong.PongServe do

  def pong do
    receive do
     {sender, :ping} ->
       IO.puts("PID #{inspect(sender)}, ping")
       :timer.sleep(1000)
       send sender, {self(), :pong}
    end
    pong()
  end

end
