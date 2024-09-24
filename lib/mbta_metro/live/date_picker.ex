defmodule MbtaMetro.Live.DatePicker do
  @moduledoc """
  A live component that renders a calendar using [Flatpickr](https://flatpickr.js.org).
  """

  use Phoenix.LiveComponent

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @doc """
  Renders the calendar.
  """
  def render(assigns) do
    ~H"""
    <div id="date-picker" phx-hook="DatePicker">
      <div id="date-picker-calendar" class="relative">
        <input type="text" data-input />
        <a href="#" data-toggle class="absolute top-3 right-2">
          <Heroicons.calendar micro fill="#003DA5" class="w-5 h-5" />
        </a>
      </div>
    </div>
    """
  end

  def handle_event("open", _value, socket) do
    {:noreply, assign(socket, :open, true)}
  end
end
