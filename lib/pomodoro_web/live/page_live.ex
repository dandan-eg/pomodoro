defmodule PomodoroWeb.PageLive do
  use PomodoroWeb, :live_view

  alias Pomodoro.Timers

  def mount(_params, _session, socket) when socket.assigns.live_action == :create do
    {:ok, timer} = Timers.create_timer()
    {:ok, redirect(socket, to: ~p"/#{timer}")}
  end

  def mount(%{"timer_id" => timer_id}, _session, socket)
      when socket.assigns.live_action == :show do
    {:ok, get_timer_or_redirect(socket, timer_id)}
  end

  def render(assigns) do
    ~H"""
    <p id="timer" phx-hook="Timer" data-start-time={@timer.start} data-duration={@timer.duration}></p>
    """
  end

  def get_timer_or_redirect(socket, timer_id) do
    assign(socket, timer: Timers.get_timer!(timer_id))
  catch
    Ecto.NoResultsError ->
      redirect(socket, to: ~p"/")
  end
end
