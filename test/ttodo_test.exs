defmodule TtodoTest do
  use ExUnit.Case
  import Mox
  import ExUnit.CaptureIO

  setup :verify_on_exit!

  describe "main/1 add" do
    test "should add task" do
      Ttodo.Util.FileHandler.FileMock |> expect(:initialize, fn _ -> %{} end)
      Ttodo.Util.FileHandler.FileMock |> expect(:write, fn _, _ -> {:ok, %{"name" => "hello"}} end)

      assert capture_io(fn -> Ttodo.main(["--add", "hello"]) end) == "New task added 'hello'\n"
    end
  end

  describe "main/1 list" do
    test "should list all task" do
      Ttodo.Util.FileHandler.FileMock
      |> expect(
        :initialize,
        fn _ -> %{
          "uniq-key" => %{
            "name" => "test",
            "created_at" => "2009-04-01T12:11:11+00:00",
            "updated_at" => "2009-04-01T12:11:11+00:00",
          }
        }
        end
      )

      assert capture_io(fn -> Ttodo.main(["--list"]) end) ==
        "|test       | 2009-04-01T12:11:11+00:00 | 2009-04-01T12:11:11+00:00 |\n"
    end
  end
end
