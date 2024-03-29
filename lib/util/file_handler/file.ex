defmodule Ttodo.Util.FileHandler.File do
  @moduledoc"""
  Module includes logic to handle File Operations
  """

  alias  Ttodo.Util.FileParser

  @behaviour Ttodo.Util.FileHandler

  @file_parser Application.get_env(:ttodo, :file_parser)

  def initialize(filename) do
    unless File.exists?(filename) do
      write(filename, @file_parser.default())
    end

    read(filename, [:read, :write])
  end

  def read(filename, mode \\ [:read]) do
    file =
      File.open!(filename, mode)
      |> IO.read(:all)

    FileParser.decode!(@file_parser, file)
  end

  def write(filename, content) when is_binary(content) do
    File.write!(filename, content)

    {:ok, content}
  end

  def write(filename, content) do
    File.write!(filename, FileParser.encode!(@file_parser, content))

    {:ok, content}
  end
end
