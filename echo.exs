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

IO.puts "This app is a simple echo server. Input something here"

Recursion.run(fn -> 
  input = IO.gets "> "
  
  compare_input = String.replace(String.downcase(input), "\n", "")
  compare_input = String.replace(compare_input, " ", "")

  messages = %{
    "hello" => "Hi there!"
  }

  if compare_input == "quit" || compare_input == "q" do
    {:quit}
  else
    if messages[compare_input] do
      IO.puts messages[compare_input]
    else
      IO.puts "Echo: " <> input
    end
    
    {:continue}
  end
end)