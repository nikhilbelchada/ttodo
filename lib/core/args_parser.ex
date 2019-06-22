defmodule Ttodo.Core.ArgsParser do
  @moduledoc"""
  Module includes logic to parse CLI args
  """

  @spec parse(list()) :: list()
  def parse(args) do
    {params, _, _} =
      args
      |> OptionParser.parse(
        switches: [
          help: :boolean,
          add: :string,
          list: [:boolean, :string],
          quit: :string,
          interactive: :boolean,
        ]
      )

    params
  end
end
