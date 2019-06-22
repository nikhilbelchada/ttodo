defmodule Ttodo.Command.NoCommand do
  @moduledoc"""
  Module includes logic for handling any unknown commands
  """

  @behaviour Ttodo.Command

  alias Ttodo.Core.Formatter

  def names, do: []

  def perform(_, _), do: perform()

  def perform, do: Formatter.format {:error, %{"msg" => "Invalid Command. \nTry using 'help'"}}
end
