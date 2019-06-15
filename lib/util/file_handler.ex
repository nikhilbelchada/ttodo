defmodule Ttodo.Util.FileHandler do
  @callback initialize(filename :: String.t()) :: {:ok, map()}
  @callback write(filename :: String.t(), content :: String.t()) :: {:ok}
end
