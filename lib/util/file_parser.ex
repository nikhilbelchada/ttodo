defmodule Ttodo.Util.FileParser do
  @moduledoc """
  Behaviour for FileParser
  """

  @callback default() :: String.t()
  @callback decode(content :: String.t()) :: {:ok, term} | {:error, String.t()}
  @callback encode(content :: String.t()) :: {:ok, term} | {:error, String.t()}

  def decode!(parser, content) do
    case parser.decode(content) do
      {:ok, data} -> data
      {:error, error} -> raise ArgumentError, "Unable to decode: #{error}"
    end
  end

  def encode!(parser, content) do
    case parser.encode(content) do
      {:ok, data} -> data
      {:error, error} -> raise ArgumentError, "Unable to encode: #{error}"
    end
  end
end
