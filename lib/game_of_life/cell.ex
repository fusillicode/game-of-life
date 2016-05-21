defmodule GameOfLife.Cell do
  use GenServer

  def new(state) do
    GenServer.start_link(__MODULE__, state)
  end

  def alive?(pid) do
    GenServer.call(pid, :state)
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end
end
