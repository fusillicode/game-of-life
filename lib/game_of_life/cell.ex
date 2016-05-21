defmodule GameOfLife.Cell do
  use GenServer

  def start_link state, coords do
    new state, coords
  end

  def new(state, coords) do
    GenServer.start_link(__MODULE__, [state: state, coords: coords])
  end

  def alive?(pid) do
    GenServer.call(pid, :alive?)
  end

  def coords(pid) do
    GenServer.call(pid, :coords)
  end

  def x(pid) do
    coords(pid) |> Enum.fetch!(0)
  end

  def y(pid) do
    coords(pid) |> Enum.fetch!(1)
  end

  def handle_call(:alive?, _from, [state: state, coords: _]) do
    {:reply, state, state}
  end

  def handle_call(:coords, _from, [state: _, coords: coords]) do
    {:reply, coords, coords}
  end
end
