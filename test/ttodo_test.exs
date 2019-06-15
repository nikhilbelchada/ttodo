defmodule TtodoTest do
  use ExUnit.Case
  import Mox

  setup :verify_on_exit!

  test "add/1 adds task to file and print content" do
    Ttodo.Util.FileHandler.FileMock |> expect(:initialize, fn _ -> %{} end)
    Ttodo.Util.FileHandler.FileMock |> expect(:write, fn _, _ -> {:ok, %{"name" => "hello"}} end)

    assert Ttodo.add("hello") == "hello"
  end

  test "add/1 adds task to existing file and print content" do
    Ttodo.Util.FileHandler.FileMock |> expect(:initialize, fn _ -> %{"uniq-key" => %{"name" => "test"}} end)
    Ttodo.Util.FileHandler.FileMock |> expect(:write, fn _, _ -> {:ok, %{"name" => "hello"}} end)

    assert Ttodo.add("hello") == "hello"
  end

  test "list/0 should list task" do
    Ttodo.Util.FileHandler.FileMock |> expect(:initialize, fn _ -> %{"uniq-key" => %{"name" => "test"}} end)

    assert Ttodo.list == "test"
  end

  test "list/0 should list multiple task" do
    Ttodo.Util.FileHandler.FileMock
    |> expect(:initialize, fn _ -> %{"uniq-key-1" => %{"name" => "test"}, "uniq-key-2" => %{"name" => "test2"}} end)

    assert Ttodo.list == "test\ntest2"
  end
end
