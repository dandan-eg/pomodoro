defmodule PomodoroWeb.PageLive do
  use PomodoroWeb, :live_view

  alias Pomodoro.Timers

  @impl true
  def mount(_params, _session, socket) when socket.assigns.live_action == :create do
    {:ok, timer} = Timers.create_timer()
    {:ok, redirect(socket, to: ~p"/#{timer}")}
  end

  @impl true
  def mount(%{"timer_id" => timer_id}, _session, socket)
      when socket.assigns.live_action == :show do
    timer = Timers.get_timer!(timer_id)

    {:ok, assign(socket, timer: timer)}
  rescue
    _ ->
      redirect(socket, to: ~p"/")
  end

  @impl true
  def render(assigns) do
    ~H"""
    <p id="timer" phx-hook="Timer" data-start-time={@timer.start} data-duration={@timer.duration}></p>
    """
  end
end
