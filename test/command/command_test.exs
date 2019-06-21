defmodule Ttodo.Command.CommandTest do
  use ExUnit.Case

  alias Ttodo.Command
  alias Ttodo.Command.{
    Add,
    List,
    Interactive,
    Quit,
    NoCommand,
  }

  test "get_command_by/1 'add' should return Add module" do
    assert Command.get_command_by(:add) == Add
    assert Command.get_command_by("add") == Add
    assert Command.get_command_by(" add  ") == Add
    assert Command.get_command_by("Add") == Add
  end

  test "get_command_by/1 'list' should return List module" do
    assert Command.get_command_by("list") == List
  end

  test "get_command_by/1 'interactive' should return Interactive module" do
    assert Command.get_command_by("interactive") == Interactive
  end

  test "get_command_by/1 'quit' should return Quit module" do
    assert Command.get_command_by("quit") == Quit
  end

  test "get_command_by/1 should return NoModule module for any unknown command" do
    assert Command.get_command_by("") == NoCommand
    assert Command.get_command_by("test") == NoCommand
  end
end
