defmodule Sample.JobQueue do
  @moduledoc false
  use EctoJob.JobQueue, table_name: "jobs"

  alias Ecto.Multi
  alias Sample.Repo

  require Logger

  @impl true
  def perform(multi, %{"type" => "normal_one"}) do
    multi
    |> Repo.transaction()
    |> case do
      _ -> {:ok, :nothign_to_do}
    end
  end

  def perform(multi, %{"type" => "failed_one"}) do
    multi
    |> Multi.run(:update, fn _repo, _changes ->
      {:error, :no_reason}
    end)
    |> Repo.transaction()
    |> case do
      {:error, step, _reason, _changes} = error ->
        Logger.error("Fail to execute job due to errors in step '#{step}'")
        error
    end
  end

  def perform(multi, %{"type" => "buggy_one"}) do
    multi
    |> Multi.run(:insert_entry, fn _repo, _chnages ->
      {:error, :already_exists}
    end)
    |> Repo.transaction()
    |> case do
      {:error, :insert_entry, :already_exists, _changes} ->
        Logger.warn("Entry already exits, nothing to insert. Will successfully finish the job")
        {:ok, :ok}
    end
  end
end
