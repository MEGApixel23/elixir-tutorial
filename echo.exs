defmodule Recursion do
  def run(func) do
    IO.puts(inspect func.())
    run(func)
  end
end

Recursion.run(fn -> 
  input = IO.gets "> "
  
  compare_input = String.replace(String.downcase(input), "\n", "")
  compare_input = String.replace(compare_input, " ", "")

  if compare_input == "quit" do
    {:ok, 1}
  else
    IO.puts "Echo: " <> input
    {:error, 0}
  end
end)