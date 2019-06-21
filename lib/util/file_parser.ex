defmodule Ttodo.Util.FileParser do
  @callback default() :: String.t()
  @callback decode(content :: String.t()) :: {:ok, term} | {:error, String.t()}
  @callback encode(content :: String.t()) :: {:ok, term} | {:error, String.t()}
end
