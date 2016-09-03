defmodule Seller do

    def ask do
        receive do
            {:ask, amt} -> IO.puts "received order for #{amt}"
            ask
        end
    end

end