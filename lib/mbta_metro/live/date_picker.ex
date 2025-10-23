defmodule MbtaMetro.Live.DatePicker do
  @moduledoc """
  A live component that renders a date picker using Flatpickr.

  You must pass in the following assigns:

    * `:id`
    * `:field` - A form field struct retrieved from a form, for example: @form[:datetime].
    * `:label`

  You can optionally pass in a `:config` map:
    * `:default_date` - The default date that should be selected.
    * `:enable_time` - A boolean that determines if the time picker should be enabled.
    * `:locale` - A two letter localization code like "es" or "zh."
    * `:max_date` - The maximum date that can be selected.
    * `:min_date` - The minimum date that can be selected.
  """

  use Phoenix.LiveComponent

  import MbtaMetro.Components.Icon, only: [icon: 1]
  import MbtaMetro.Components.Input, only: [input: 1]

  def mount(_params, _session, socket) do
    config = Map.get(socket.assigns, :config, %{})
    {locale, new_config} = Map.pop(config, :locale, "en")
    new_socket = assign(socket, config: new_config, locale: locale)

    {:ok, new_socket}
  end

  @doc """
  Renders the date picker component.
  """
  def render(assigns) do
    ~H"""
    <div
      id={@id}
      phx-hook="DatePicker"
      phx-update="ignore"
      data-config={Jason.encode!(@config)}
      class="mbta-date-picker"
      data-locale={@locale}
    >
      <div class="mbta-date-picker--calendar">
        <.input id={"#{@id}-input"} type="datetime-local" field={@field} value={nil} name={@field.name} data-input>{@label}</.input>
        <a href="#" data-toggle>
          <.icon name="calendar" type="regular" class="mbta-date-picker--icon" />
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
