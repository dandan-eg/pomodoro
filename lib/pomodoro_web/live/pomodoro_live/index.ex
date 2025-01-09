defmodule PomodoroWeb.PomodoroLive.Index do
  use PomodoroWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       start_time: System.system_time(:second)
     )}
  end

  def render(assigns) do
    ~H"""
    <p id="timer" phx-hook="Timer" data-start-time={@start_time} data-duration={@duration}></p>
    """
  end
end
