defmodule MbtaMetro.Live.DatePicker do
  @moduledoc """
  A live component that renders a date picker using Flatpickr.

  You must pass in the following assigns:

    * `:field` - A form field struct retrieved from a form, for example: @form[:datetime].

  You can optionally pass in a `:config` map:
    * `:default_date` - The default date that should be selected.
    * `:enable_time` - A boolean that determines if the time picker should be enabled.
    * `:max_date` - The maximum date that can be selected.
    * `:min_date` - The minimum date that can be selected.
  """

  use Phoenix.LiveComponent

  import MbtaMetro.Components.Icon, only: [icon: 1]
  import MbtaMetro.Components.Input, only: [input: 1]

  def mount(_params, _session, socket) do
    config = Map.get(socket.assigns, :config, %{})
    new_socket = assign(socket, config: config)

    {:ok, new_socket}
  end

  @doc """
  Renders the date picker component.
  """
  def render(assigns) do
    ~H"""
    <div
      id="date-picker"
      phx-hook="DatePicker"
      phx-update="ignore"
      data-config={Jason.encode!(@config)}
      class="min-w-72"
    >
      <div id="date-picker-calendar" class="relative">
        <.input type="datetime-local" field={@field} class="w-full" value={nil} data-input />
        <a href="#" data-toggle class="absolute top-3.5 right-2.5">
          <.icon name="calendar" type="regular" class="w-4 h-4 fill-cobalt-20" />
        </a>
      </div>
    </div>
    """
  end

  @doc """
  When we get an event to set the dateime, we push the event to the socket.
  This will be picked up by the Hook.
  """
  def handle_event("set_datetime", %{"datetime" => datetime}, socket) do
    {:noreply, push_event(socket, "set-datetime", %{datetime: datetime})}
  end
end
