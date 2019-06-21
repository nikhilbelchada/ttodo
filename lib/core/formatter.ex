defmodule Ttodo.Core.Formatter do
  def format({:error, %{"msg" => msg}}) do
    IO.puts msg
  end

  def format({:ok, %{"msg" => msg}}) do
    IO.puts msg
  end

  def format({:ok, []}), do: nil
  def format({:ok, [head | tail] = msgs}) when is_list(msgs) do
    IO.puts head

    format({:ok, tail})
  end
end
