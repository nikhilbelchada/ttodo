defmodule Ttodo.Command.List do
  @moduledoc"""
  Module includes logic to list all todos
  """

  @behaviour Ttodo.Command

  alias Ttodo.Core.{
    FileHandler,
    Formatter,
  }

  def names, do: ["list", :list]

  def perform(_, []) do
    result =
      FileHandler.initialize
      |> Enum.map(fn {_id, todo} -> format(todo) end)

    {:ok, result}
    |> Formatter.format
  end

  @spec format(data :: map()) :: String.t()
  def format(%{"name" => name, "created_at" => c_at, "updated_at" => u_at}) do
    "|#{String.pad_trailing(name, 10)} | #{String.pad_trailing(c_at, 10)} | #{String.pad_trailing(u_at, 10)} |"
  end
end
