defmodule MbtaMetro.Live.Map do
  @moduledoc """
  A live component that renders a map using [maplibre-gl](https://maplibre.org/maplibre-gl-js/docs/).

  You can optionally pass in the following assigns:

    * `:class` - The CSS classes to apply to the map container. You'll most likely want to set the height and width of the map here.
    * `:click_handler` - A boolean indicating whether to handle map clicks.
    * `:lines` - A list of lists of coordinates to draw lines on the map. Each list of coordinates should be a list of two numbers: the longitude and latitude.
    * `:markers` - A list of coordinates to place markers on the map. Each coordinate should be a list of two numbers: the longitude and latitude.
    * `:style` - The style to apply to the map. This can be a maplibre style object or a URL to a style JSON file.

  If `:click_handler` is `true`, the component will send a `map-clicked` event to the parent live view when the map is clicked.

  `markers` will be assigned a letter A-Z for each marker added to the map. E.g., 0 => A, 1 => B, etc.
  """

  use Phoenix.LiveComponent

  import MbtaMetro.Components.Icon, only: [icon: 1]

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @doc """
  Renders the map component.
  """
  def render(assigns) do
    assigns
    |> Map.get(:class, "")
    |> Kernel.then(&assign(assigns, :class, &1))
    |> Map.get(:click_handler, false)
    |> Kernel.then(&assign(assigns, :click_handler, &1))
    |> Map.get(:lines, [])
    |> Kernel.then(&assign(assigns, :lines, &1))
    |> Map.get(:markers, [])
    |> Kernel.then(&assign(assigns, :markers, &1))
    |> Map.get(:style, %{})
    |> Kernel.then(&assign(assigns, :style, &1))

    ~H"""
    <div
      id="map"
      class={@class}
      data-click-handler={Jason.encode!(@click_handler)}
      data-style={Jason.encode!(@style)}
      phx-hook="Map"
    >
      <%= for {coordinates, index} <- Enum.with_index(@markers) do %>
        <.icon id={"mbta-metro-marker-#{index}"} type="metro" name={index_to_pin(index)} class="mbta-metro-marker w-8 h-8 fill-blue-500" data-coordinates={Jason.encode!(coordinates)}/>
      <% end %>
    </div>
    """
  end

  def handle_event("add-marker", [lng, lat], socket) do
    new_socket =
      socket
      |> push_event("marker-added", [Kernel.length(socket.assigns.markers), lng, lat])
      |> assign(:markers, [socket.assigns.markers | [lng, lat]])

    {:noreply, new_socket}
  end

  def handle_event("remove-marker", index, socket) do
    {_, markers} = List.pop_at(socket.assigns.markers, index)

    new_socket =
      socket
      |> push_event("marker-removed", index)
      |> assign(:markers, markers)

    {:noreply, new_socket}
  end

  defp index_to_pin(idx) when idx >= 0 and idx < 26 do
    alphabet = ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

    "location-pin-#{Enum.at(alphabet, idx)}"
  end
end
