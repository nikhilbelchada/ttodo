defmodule Ttodo.Util.FileParser.Json do
  @moduledoc"""
  Modules includes logic related to JSON file parsing
  """

  @behaviour Ttodo.Util.FileParser

  def default, do: "{}"

  def decode(content), do: Poison.decode(content)

  def encode(content), do: Poison.encode(content)
end
