defmodule GameOfLife.CellTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = GameOfLife.Cell.new(false, [0,0])
    {:ok, pid: pid}
  end

  test "it behaves like a gen server", state do
    assert Process.alive? state[:pid]
  end

  test "alive? returns false if the initial state is false", state do
    assert GameOfLife.Cell.alive?(state[:pid]) == false
  end

  test "alive? returns true if the initial state is true", state do
    {:ok, pid} = GameOfLife.Cell.new true, [0,0]
    assert GameOfLife.Cell.alive?(pid) == true
  end

  test "x returns 0 if the initial x coord is 0", state do
    assert GameOfLife.Cell.x(state[:pid]) == 0
  end

  test "x returns 1 if the initial x coord is 1", state do
    {:ok, pid} = GameOfLife.Cell.new true, [1,0]
    assert GameOfLife.Cell.x(pid) == 1
  end

  test "y returns 0 if the initial y coord is 0", state do
    assert GameOfLife.Cell.y(state[:pid]) == 0
  end

  test "y returns 1 if the initial y coord is 1", state do
    {:ok, pid} = GameOfLife.Cell.new true, [0,1]
    assert GameOfLife.Cell.y(pid) == 1
  end
end
