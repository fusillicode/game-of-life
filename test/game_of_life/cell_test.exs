defmodule GameOfLife.CellTest do
  use ExUnit.Case

  test "it behaves like a gen server" do
    {:ok, pid} = GameOfLife.Cell.new false
    assert Process.alive? pid
  end

  test "alive? returns false if the initial state is false" do
    {:ok, pid} = GameOfLife.Cell.new false
    assert GameOfLife.Cell.alive?(pid) == false
  end

  test "alive? returns true if the initial state is true" do
    {:ok, pid} = GameOfLife.Cell.new true
    assert GameOfLife.Cell.alive?(pid) == true
  end
end
