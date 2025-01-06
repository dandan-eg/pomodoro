defmodule PomodoroWeb.PomodoroLive.Index do
  use PomodoroWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket), do: schedule_reset()

    {:ok,
     assign(socket,
       start_time: System.system_time(:second),
       duration: 5
     )}
  end

  def render(assigns) do
    ~H"""
    <p id="countdown" phx-hook="Countdown" data-start-time={@start_time} data-duration={@duration}>
    </p>
    """
  end

  def handle_info(:reset, socket) do
    {:noreply,
     assign(socket,
       start_time: System.system_time(:second),
       duration: 2
     )}
  end

  def schedule_reset() do
    Process.send_after(self(), :reset, 5_000)
  end
end
