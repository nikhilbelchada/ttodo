defmodule Ttodo.Command.NoCommandTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias Ttodo.Command.NoCommand

  test "perform/0 should return tuple with error message" do
    assert capture_io(fn -> NoCommand.perform(nil, []) end) == "Invalid Command. \nTry using 'help'\n"
  end
end
