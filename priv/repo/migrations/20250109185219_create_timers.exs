defmodule Pomodoro.Repo.Migrations.CreateTimers do
  use Ecto.Migration

  def change do
    create table(:timers) do
      add :start, :integer
      add :duration, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
