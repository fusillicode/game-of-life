defmodule GameOfLife.Cell do
  use GenServer

  def new(state) do
    GenServer.start_link(__MODULE__, state)
  end

  def alive?(pid) do
    GenServer.call(pid, :alive?)
  end

  def handle_call(:alive?, _from, state) do
    {:reply, state, state}
  end
end
