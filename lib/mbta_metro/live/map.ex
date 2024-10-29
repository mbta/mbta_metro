defmodule MbtaMetro.Live.Map do
  @moduledoc """
  A live component that renders a map using [maplibre-gl](https://maplibre.org/maplibre-gl-js/docs/).

  You can optionally pass in the following assigns:

    * `:class` - The CSS classes to apply to the map container. You'll most likely want to set the height and width of the map here.
    * `:config` - The maplibre gl configuration.
    * `:click_handler` - A boolean indicating whether to handle map clicks.
    * `:lines` - A list of lists of coordinates to draw lines on the map. Each list of coordinates should be a list of two numbers: the longitude and latitude.
    * `:pins` - A list of coordinates to place pins on the map. Each coordinate should be a list of two numbers: the longitude and latitude.
    * `:points` - A list of coordinates to place points on the map. Each coordinate should be a list of two numbers: the longitude and latitude.

  If `:click_handler` is `true`, the component will send a `map-clicked` event to the parent live view when the map is clicked.

  `pins` will be assigned a letter A-Z for each marker added to the map. E.g., 0 => A, 1 => B, etc.
  """

  use Phoenix.LiveComponent

  import MbtaMetro.Components.Icon, only: [icon: 1]

  def mount(_params, _session, socket) do
    class = Map.get(socket.assigns, :class, "")
    config = Map.get(socket.assigns, :config, %{})
    lines = Map.get(socket.assigns, :lines, [])
    pins = Map.get(socket.assigns, :pins, [])
    points = Map.get(socket.assigns, :points, [])

    new_socket = assign(socket, class: class, config: config, lines: lines, pins: pins, points: points)

    {:ok, new_socket}
  end

  @doc """
  Renders the map component.
  """
  def render(assigns) do
    ~H"""
    <div
      id="mbta-metro-map"
      class={@class}
      data-config={Jason.encode!(@config)}
      phx-hook="Map"
    >
      <div id="mbta-metro-map-container" class="w-full h-full relative overflow-hidden" phx-update="ignore" />
      <div id="mbta-metro-map-lines" class="hidden">
        <%= for {line, index} <- Enum.with_index(@lines) do %>
          <div id={"mbta-metro-line-#{index}"} data-line={Jason.encode!(line)} />
        <% end %>
      </div>
      <div id="mbta-metro-map-markers" class="hidden">
        <%= for {coordinates, index} <- Enum.with_index(@points) do %>
          <.icon id={"mbta-metro-point-#{index}"} type="metro" name="point" class="w-4 h-4 fill-blue-500" data-coordinates={Jason.encode!(coordinates)} />
        <% end %>
        <%= for {coordinates, index} <- Enum.with_index(@pins) do %>
          <.icon id={"mbta-metro-pin-#{index}"} type="metro" name={index_to_pin(index)} class="w-8 h-8 fill-blue-500" data-coordinates={Jason.encode!(coordinates)} />
        <% end %>
      </div>
    </div>
    """
  end

  def handle_event("map-loaded", _params, socket) do
    new_socket =
      socket
      |> push_event("update-lines", %{lines: socket.assigns.lines})
      |> push_event("update-markers", %{markers: socket.assigns.pins ++ socket.assigns.points})

    {:noreply, new_socket}
  end

  defp index_to_pin(idx) when idx >= 0 and idx < 26 do
    alphabet = ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

    "location-pin-#{Enum.at(alphabet, idx)}"
  end
end
