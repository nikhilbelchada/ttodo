defmodule Ttodo.Util.FileParser do
  @moduledoc """
  Behaviour for FileParser
  """

  @callback default() :: String.t()
  @callback decode(content :: String.t()) :: {:ok, term} | {:error, String.t()}
  @callback encode(content :: String.t()) :: {:ok, term} | {:error, String.t()}
end
