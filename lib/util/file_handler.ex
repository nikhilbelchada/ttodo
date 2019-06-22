defmodule Ttodo.Util.FileHandler do
  @moduledoc """
  Behaviour for FileHandler
  """

  @callback initialize(filename :: String.t()) :: {:ok, map()}
  @callback write(filename :: String.t(), content :: String.t()) :: {:ok, String.t()}
end
