defmodule GameOfLife.Cell do
  use GenServer

  def new(state, coords) do
    GenServer.start_link(__MODULE__, [state: state, coords: coords])
  end

  def alive?(pid) do
    GenServer.call(pid, :alive?)
  end

  def x(pid) do
    GenServer.call(pid, :x)
  end

  def y(pid) do
    GenServer.call(pid, :y)
  end

  def handle_call(:alive?, _from, [state: state, coords: _]) do
    {:reply, state, state}
  end

  def handle_call(:x, _from, [state: _, coords: [x,_]]) do
    {:reply, x, x}
  end

  def handle_call(:y, _from, [state: _, coords: [_,y]]) do
    {:reply, y, y}
  end
end
