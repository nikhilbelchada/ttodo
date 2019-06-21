defmodule Ttodo.Command.ListTest do
  use ExUnit.Case
  import Mox
  import ExUnit.CaptureIO

  alias Ttodo.Command.List

  setup :verify_on_exit!

  test "list/0 should list task" do
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

    assert capture_io(fn -> List.perform(true, []) end) ==
      "|test       | 2009-04-01T12:11:11+00:00 | 2009-04-01T12:11:11+00:00 |\n"
  end

  test "list/0 should list multiple task" do
    Ttodo.Util.FileHandler.FileMock
    |> expect(
      :initialize,
      fn _ -> %{
        "uniq-key-1" => %{
          "name" => "test",
          "created_at" => "2009-04-01T12:11:11+00:00",
          "updated_at" => "2009-04-01T12:11:11+00:00",
        },
        "uniq-key-2" => %{
          "name" => "test2",
          "created_at" => "2009-04-02T12:11:11+00:00",
          "updated_at" => "2009-04-02T12:11:11+00:00",
        }
      }
      end
    )

    assert capture_io(fn -> List.perform(true, []) end) ==
      ~s(|test       | 2009-04-01T12:11:11+00:00 | 2009-04-01T12:11:11+00:00 |
|test2      | 2009-04-02T12:11:11+00:00 | 2009-04-02T12:11:11+00:00 |
)
  end
end
