defmodule GameOfLife.CellTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = GameOfLife.Cell.new(false)
    {:ok, pid: pid}
  end

  test "it behaves like a gen server", state do
    assert Process.alive? state[:pid]
  end

  test "alive? returns false if the initial state is false", state do
    assert GameOfLife.Cell.alive?(state[:pid]) == false
  end

  test "alive? returns true if the initial state is true", state do
    {:ok, pid} = GameOfLife.Cell.new true
    assert GameOfLife.Cell.alive?(pid) == true
  end
end
