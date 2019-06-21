defmodule Ttodo.Command.NoCommand do
  @behaviour Ttodo.Command

  alias Ttodo.Core.Formatter

  @spec names() :: List.t()
  def names, do: []

  @spec perform(name :: String.t(), args :: List.t()) :: String.t()
  def perform(_, _), do: perform()

  @spec perform() :: String.t()
  def perform(), do: Formatter.format {:error, %{"msg" => "Invalid Command. \nTry using 'help'"}}
end
