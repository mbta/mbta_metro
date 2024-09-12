defmodule MbtaMetro.Live.Map do
  @moduledoc """
  A live component that renders a map using AWS Location Service.

  You must pass in the following assigns:

    * `:api_key` - The AWS Location Service API key.
    * `:map_name` - The name of the map to render.
    * `:region` - The AWS region where the map is located.

  You can optionally pass in the following assigns:

    * `:class` - The CSS classes to apply to the map container. You'll most likely want to set the height and width of the map here.
    * `:click_handler` - A boolean indicating whether to handle map clicks.

  If `:click_handler` is `true`, the component will send a `map-clicked` event to the parent live view when the map is clicked.
  """

  use Phoenix.LiveComponent

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @doc """
  Renders the map component.
  """
  def render(assigns) do
    class = Map.get(assigns, :class, "")
    click_handler = Map.get(assigns, :click_handler, false)

    ~H"""
    <div
      id="map"
      class={class}
      data-api-key={@api_key}
      data-map-name={@map_name}
      data-region={@region}
      data-click-handler={Jason.encode!(click_handler)}
      phx-hook="Map"
    >
    </div>
    """
  end
end
