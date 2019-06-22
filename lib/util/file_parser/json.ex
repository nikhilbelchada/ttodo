defmodule Ttodo.Util.FileParser.Json do
  @moduledoc"""
  Modules includes logic related to JSON file parsing
  """

  @behaviour Ttodo.Util.FileParser

  def default, do: "{}"

  def decode(content), do: Poison.decode(content)
  def decode!(content) do
    case decode(content) do
      {:ok, data} -> data
      {:error, error} -> raise ArgumentError, "Unable to decode: #{error}"
    end
  end

  def encode(content), do: Poison.encode(content)
  def encode!(content) do
    case encode(content) do
      {:ok, data} -> data
      {:error, error} -> raise ArgumentError, "Unable to encode: #{error}"
    end
  end
end
