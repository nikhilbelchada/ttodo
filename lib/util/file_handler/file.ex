defmodule Ttodo.Util.FileHandler.File do
  @behaviour Ttodo.Util.FileHandler

  def initialize(filename) do
    unless File.exists?(filename) do
      write(filename, "{}")
    end

    read(filename, [:read, :write])
  end

  def read(filename, mode \\ [:read]) do
    File.open!(filename, mode)
    |> IO.read(:all)
    |> Poison.decode!()
  end

  def write(filename, content) when is_binary(content) do
    File.write!(filename, content)

    {:ok, content}
  end

  def write(filename, content) when is_map(content) do
    File.write!(filename, Poison.encode!(content))

    {:ok, content}
  end

  def write(_filename, content) do
    throw("Invalid file content")
  end
end
