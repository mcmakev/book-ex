defmodule Buyer do
    def bid(pid, amt) do
        IO.puts "sending!"
        send pid, {:bid, amt}
    end
end
