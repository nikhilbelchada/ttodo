defmodule Ttodo.Core.Formatter do
  @moduledoc"""
  Used by Commands to format their output
  """

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
