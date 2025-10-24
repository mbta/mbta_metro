defmodule MbtaMetro.Live.Map do
  @moduledoc """
  A live component that renders a map using [maplibre-gl](https://maplibre.org/maplibre-gl-js/docs/).

  You can optionally pass in the following assigns:

    * `:class` - The CSS classes to apply to the map component. You'll most likely want to set the height and width of the map here.
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

  @doc """
  We check if the map is loaded; if so, we tell the Hook to update the lines and markers every time the component updates.
  If the map is not loaded, we check for for assigns and assign defaults for any not passed into the component.
  """
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
    new_socket =
      assign(socket,
        id: Map.fetch!(assigns, :id),
        class: Map.get(assigns, :class, ""),
        config: Map.get(assigns, :config, %{}),
        lines: Map.get(assigns, :lines, []),
        loaded: false,
        pins: Map.get(assigns, :pins, []),
        points: Map.get(assigns, :points, [])
      )

    {:ok, new_socket}
  end

  @doc """
  There are three main sections of the map component.
  The wrapper will hold the map itself.
  The lines will hold the lines to draw on the map.
  The markers will hold the points and pins to place on the map.

  The associated Hook will take the lines and markers and draw them on the map.
  """
  @impl true
  def render(assigns) do
    ~H"""
    <div
      id={@id}
      class={"mbta-metro-map #{@class}"}
      data-config={Jason.encode!(@config)}
      phx-hook="Map"
    >
      <div
        id={"#{@id}-map-container"}
        class="mbta-metro-map-wrapper"
        phx-update="ignore"
      />
      <div class="hidden">
        <%= for {line, index} <- Enum.with_index(@lines) do %>
          <div data-line={Jason.encode!(line)} />
        <% end %>
        <%= for {coordinates, index} <- Enum.with_index(@points) do %>
          <.icon
            type="metro"
            name="point"
            class="mbta-metro-map-point"
            data-coordinates={Jason.encode!(coordinates)}
          />
        <% end %>
        <%= for {coordinates, index} <- Enum.with_index(@pins) do %>
          <.icon
            type="metro"
            name={index_to_pin(index)}
            class="mbta-metro-map-pin"
            data-coordinates={Jason.encode!(coordinates)}
          />
        <% end %>
      </div>
    </div>
    """
  end

  @doc """
  The map has to be loaded before we can draw anything on it.
  Once the Hook tells us it has loaded, we tell it to update the lines and markers.
  We then update the `loaded` assign to `true` so we know future updates can be drawn on the map.
  """
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
