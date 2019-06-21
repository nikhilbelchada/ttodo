defmodule Ttodo.Core.ArgsParser do
  @spec parse(args :: String) :: String
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
