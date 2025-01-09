defmodule Pomodoro.Repo.Migrations.CreateTimers do
  use Ecto.Migration

  def change do
    create table(:timers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :start, :integer
      add :duration, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
