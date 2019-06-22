defmodule Ttodo.Command.Interactive do
  @moduledoc"""
  Module includes logic to handle interactive mode
  """

  @behaviour Ttodo.Command

  @spec names() :: List.t()
  def names, do: ["interactive", :interactive]

  @spec perform(name :: String.t(), args :: List.t()) :: String.t()
  def perform(_, _) do
    IO.gets("\nTtodo-> ")
    |> String.trim
    |> String.split(" ")
    |> Enum.reject(&(&1 == ""))
    |> Ttodo.Command.execute

    perform(nil, [])
  end
end
