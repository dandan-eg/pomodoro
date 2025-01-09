defmodule Pomodoro.Timers.Timer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "timers" do
    field :start, :integer
    field :duration, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(timer, attrs) do
    timer
    |> cast(attrs, [:start, :duration])
    |> validate_required([:start, :duration])
  end
end
