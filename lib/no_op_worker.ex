defmodule NoOpWorker do
  def perform() do
    :timer.sleep(:rand.uniform(10) * 1000)
  end
end
