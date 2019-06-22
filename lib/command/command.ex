defmodule Ttodo.Command do
  @moduledoc"""
  Behaviour Module for All Commands
  """

  @callback perform(arg :: String.t(), args :: List.t()) :: String.t()
  @callback names() :: List.t()

  alias Ttodo.Command.NoCommand

  @spec sub_modules() :: List.t()
  def sub_modules do
    {:ok, modules} = :application.get_key(:ttodo, :modules)

    modules
    |> Enum.filter(& String.contains?(Atom.to_string(&1), "#{__MODULE__}."))
  end

  @spec get_command_by(command_name :: String.t()) :: atom()
  def get_command_by(command_name) when is_atom(command_name), do: get_command_by(Atom.to_string(command_name))
  def get_command_by(command_name) do
    command_name =
      command_name
      |> String.trim
      |> String.downcase

    command =
      sub_modules()
      |> Enum.find(fn(module) -> command_name in module.names end)

    command || NoCommand
  end

  @spec execute(commands :: List.t()) :: String.t()
  def execute([]), do: NoCommand.perform(nil, [])
  def execute([command_name, arg | args]) do
    execute([{command_name, arg} | args])
  end
  def execute([{command_name, arg} | args]) do
    get_command_by(command_name).perform(arg, args)
  end
  def execute([command_name | args]) do
    get_command_by(command_name).perform(true, args)
  end
end
