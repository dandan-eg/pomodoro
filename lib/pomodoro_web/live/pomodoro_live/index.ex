defmodule PomodoroWeb.PomodoroLive.Index do
  use PomodoroWeb, :live_view

  def mount(_params, _session, socket) do
    duration = 6
    if connected?(socket), do: schedule_reset(duration)

    {:ok,
     assign(socket,
       start_time: System.system_time(:second),
       duration: duration
     )}
  end

  def render(assigns) do
    ~H"""
    <p id="countdown" phx-hook="Countdown" data-start-time={@start_time} data-duration={@duration}>
    </p>
    """
  end

  def handle_info(:reset, socket) do
    duration = 4
    schedule_reset(duration)

    {:noreply,
     assign(socket,
       start_time: System.system_time(:second),
       duration: duration
     )}
  end

  def schedule_reset(time_in_seconds) do
    time_in_milliseconds = time_in_seconds * 1000
    Process.send_after(self(), :reset, time_in_milliseconds)
  end
end
