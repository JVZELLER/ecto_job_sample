defmodule Sample.JobQueue do
  @moduledoc false
  use EctoJob.JobQueue, table_name: "jobs"

  @impl true
  def perform(_multi, _params) do
    {:ok, :ok}
  end
end
