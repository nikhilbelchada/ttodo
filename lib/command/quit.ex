defmodule Ttodo.Command.Quit do
  @moduledoc"""
  Module includes logic for quiting from interactive mode
  """

  @behaviour Ttodo.Command

  def names, do: ["quit", :quit]

  def perform(_, _), do: perform()

  def perform do
    IO.puts("Stay Hungry.. Stay Taskish..")
    IO.puts("Bye Bye!!")
    exit(:shutdown)
  end
end
