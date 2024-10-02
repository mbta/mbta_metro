defmodule MbtaMetro.Live.DatePicker do
  @moduledoc """
  A live component that renders a calendar using [Flatpickr](https://flatpickr.js.org).
  """

  use Phoenix.LiveComponent

  import MbtaMetro.Components.Input, only: [input: 1]

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @doc """
  Renders the calendar.
  """
  def render(assigns) do
    ~H"""
    <div id="date-picker" phx-hook="DatePicker" class="min-w-64">
      <div id="date-picker-calendar" class="relative">
        <.input type="datetime-local" name={@name} value={@value} data-input />
        <a href="#" data-toggle class="absolute top-3 right-2">
          <Heroicons.calendar micro class="w-5 h-5" />
        </a>
      </div>
    </div>
    """
  end

  def handle_event("set-datetime-now", _value, socket) do
    {:noreply, assign(socket, :value, Timex.now())}
  end

  def handle_event("set-datetime-five-minutes", _value, socket) do
    time = Timex.now() |> Timex.shift(minutes: 5)

    {:noreply, assign(socket, :value, time)}
  end
end
