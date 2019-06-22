defmodule Ttodo.Command.Quit do
  @moduledoc"""
  Module includes logic for quiting from interactive mode
  """

  @behaviour Ttodo.Command

  @spec names() :: List.t()
  def names, do: ["quit", :quit]

  @spec perform(name :: String.t(), args :: List.t()) :: String.t()
  def perform(_, _), do: perform()

  @spec perform() :: nil
  def perform do
    IO.puts("Stay Hungry.. Stay Taskish..")
    IO.puts("Bye Bye!!")
    exit(:shutdown)
  end
end
