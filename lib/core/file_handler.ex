defmodule Ttodo.Core.FileHandler do
  @moduledoc"""
  Wrapper to Util.FileHandler for simplification
  """

  @filename "todo.json"
  @file_handler Application.get_env(:ttodo, :file_handler)

  def initialize(file \\ @filename) do
    @file_handler.initialize(file)
  end

  def write(content) do
    @file_handler.write(@filename, content)
  end
end
