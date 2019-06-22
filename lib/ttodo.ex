defmodule Ttodo do
  @moduledoc """
  Entry Point for escript to perform CLI operation
  """

  alias Ttodo.Command
  alias Ttodo.Core.ArgsParser

  @doc """
  Entry point for app via escript
  """
  def main(args) do
    args
    |> ArgsParser.parse
    |> Command.execute
  end
end
