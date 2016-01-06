defmodule Recursion do
  def run(func) do
    res = func.()
    if elem(res, 0) === :quit do
      {:ok}
    else
      run(func)
    end
  end
end

Recursion.run(fn -> 
  input = IO.gets "> "
  
  compare_input = String.replace(String.downcase(input), "\n", "")
  compare_input = String.replace(compare_input, " ", "")

  if compare_input == "quit" do
    {:quit}
  else
    IO.puts "Echo: " <> input
    {:continue}
  end
end)