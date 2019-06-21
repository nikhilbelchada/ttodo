defmodule Ttodo.Command.AddTest do
  use ExUnit.Case
  import Mox
  import ExUnit.CaptureIO

  alias Ttodo.Command.Add

  setup :verify_on_exit!

  test "perform/1 adds task to file" do
    Ttodo.Util.FileHandler.FileMock |> expect(:initialize, fn _ -> %{} end)
    Ttodo.Util.FileHandler.FileMock |> expect(:write, fn _, _ -> {:ok, %{"name" => "hello"}} end)

    assert capture_io(fn -> Add.perform("hello", []) end) == "New task added 'hello'\n"
  end

  test "add/1 adds task to existing file" do
    Ttodo.Util.FileHandler.FileMock |> expect(:initialize, fn _ -> %{"uniq-key" => %{"name" => "test"}} end)
    Ttodo.Util.FileHandler.FileMock |> expect(:write, fn _, _ -> {:ok, %{"name" => "hello"}} end)

    assert capture_io(fn -> Add.perform("hello", []) end) == "New task added 'hello'\n"
  end
end
