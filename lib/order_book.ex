defmodule OrderBook do

  def start_link do
    Task.start_link(fn -> loop([], []) end)
  end

  defp loop(bids, asks) do
    print_sides bids, asks
    receive do
      {:bid, price} -> 
        b = bids ++ [price]
        loop(b, asks)
      {:ask, price} ->
        a = asks ++ [price]
        loop(bids, a)
      {:dump_book, caller} ->
        send caller, {bids, asks}
     end
  end

  defp print_sides(bids, asks) do
    IO.puts "Bids: #{Enum.join(bids, ",")}"
    IO.puts "Asks: #{Enum.join(asks, ",")}"
  end
end
