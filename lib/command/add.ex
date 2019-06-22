defmodule Ttodo.Command.Add do
  @moduledoc"""
  Module include logic for adding todo
  """

  @behaviour Ttodo.Command

  alias Ttodo.Core.{
    FileHandler,
    Formatter,
  }

  @spec names() :: List.t()
  def names, do: ["add", :add]

  @spec perform(name :: String.t(), args :: List.t()) :: String.t()
  def perform(name, []) do
    FileHandler.initialize
    |> add_todo(name)
    |> Formatter.format
  end

  @spec add_todo(file_content :: map(), name :: String.t()) :: tuple()
  def add_todo(file_content, name) do
    file_content
    |> Map.put(
      UUID.uuid1(),
      %{
        "name" => name,
        "created_at" => Timex.format!(Timex.now(), "%FT%T%:z", :strftime),
        "updated_at" => Timex.format!(Timex.now(), "%FT%T%:z", :strftime)
      }
    )
    |> FileHandler.write

    {:ok, %{"msg" => "New task added '#{name}'"}}
  end
end
