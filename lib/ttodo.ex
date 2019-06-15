defmodule Ttodo do
  @filename "todo.json"
  @file_handler Application.get_env(:ttodo, :file_handler)

  @moduledoc """
  Main module
  """

  @doc """
  Adds ttodo
  """
  def add(name) do
    @file_handler.initialize(@filename)
    |> add_todo!(name)
    |> prittyfi
  end

  @doc """
  list all todos
  """
  def list() do
    @file_handler.initialize(@filename)
    |> Enum.map(fn {_id, todo} -> prittyfi(todo) end)
    |> Enum.join("\n")
  end

  defp add_todo!(file_content, name) do
    {:ok, content} = add_todo(file_content, name)

    content
  end

  defp add_todo(file_content, name) do
    content =
      file_content
      |> Map.put(
        UUID.uuid1(),
        %{
          "name" => name,
          "created_at" => Timex.format!(Timex.now(), "%FT%T%:z", :strftime),
          "updated_at" => Timex.format!(Timex.now(), "%FT%T%:z", :strftime)
        }
      )

    @file_handler.write(@filename, content)
  end

  defp prittyfi(content) do
    content["name"]
  end
end
