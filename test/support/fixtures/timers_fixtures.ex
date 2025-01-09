defmodule Pomodoro.TimersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pomodoro.Timers` context.
  """

  @doc """
  Generate a timer.
  """
  def timer_fixture(attrs \\ %{}) do
    {:ok, timer} =
      attrs
      |> Enum.into(%{
        duration: 42,
        start: 42
      })
      |> Pomodoro.Timers.create_timer()

    timer
  end
end
