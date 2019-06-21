defmodule Ttodo do
  alias Ttodo.Core.ArgsParser
  alias Ttodo.Command

  @doc """
  Entry point for app via escript
  """
  def main(args) do
    args
    |> ArgsParser.parse
    |> Command.execute
  end
end
