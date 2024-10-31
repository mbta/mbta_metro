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

  @impl true
  def update(assigns, %{assigns: %{loaded: true}} = socket) do
    new_socket =
      socket
      |> assign(assigns)
      |> push_event("update-lines", %{})
      |> push_event("update-markers", %{})

    {:ok, new_socket}
  end

  def update(assigns, socket) do
    class = Map.get(assigns, :class, "")
    config = Map.get(assigns, :config, %{})
    lines = Map.get(assigns, :lines, [])
    pins = Map.get(assigns, :pins, [])
    points = Map.get(assigns, :points, [])

    new_socket =
      assign(socket,
        class: class,
        config: config,
        lines: lines,
        loaded: false,
        pins: pins,
        points: points
      )

    {:ok, new_socket}
  end

  @doc """
  Renders the map component.
  """
  @impl true
  def render(assigns) do
    ~H"""
    <div id="mbta-metro-map" class={@class} data-config={Jason.encode!(@config)} phx-hook="Map">
      <div
        id="mbta-metro-map-container"
        class="w-full h-full relative overflow-hidden"
        phx-update="ignore"
      />
      <div id="mbta-metro-map-lines" class="hidden">
        <%= for {line, index} <- Enum.with_index(@lines) do %>
          <div id={"mbta-metro-line-#{index}"} data-line={Jason.encode!(line)} />
        <% end %>
      </div>
      <div id="mbta-metro-map-markers" class="hidden">
        <%= for {coordinates, index} <- Enum.with_index(@points) do %>
          <.icon
            id={"mbta-metro-point-#{index}"}
            type="metro"
            name="point"
            class="w-4 h-4 fill-blue-500"
            data-coordinates={Jason.encode!(coordinates)}
          />
        <% end %>
        <%= for {coordinates, index} <- Enum.with_index(@pins) do %>
          <.icon
            id={"mbta-metro-pin-#{index}"}
            type="metro"
            name={index_to_pin(index)}
            class="w-16 h-16 fill-blue-500"
            data-coordinates={Jason.encode!(coordinates)}
          />
        <% end %>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("map-loaded", _params, socket) do
    new_socket =
      socket
      |> assign(:loaded, true)
      |> push_event("update-lines", %{})
      |> push_event("update-markers", %{})

    {:noreply, new_socket}
  end

  defp index_to_pin(idx) when idx >= 0 and idx < 26 do
    alphabet = ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

    "location-pin-#{Enum.at(alphabet, idx)}"
  end
end
