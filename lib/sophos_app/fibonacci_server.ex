defmodule SophosApp.Fibonacci_Server do

  def loop() do
    receive do
      message -> IO.puts(message)
        # code
    end

  end

end
