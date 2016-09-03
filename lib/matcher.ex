defmodule Matcher do
	import Seller
	import Buyer

	def start do
	    IO.puts "what?"
	    pid = spawn fn -> ask end
	    bid(pid, 45.45)
	end
end
