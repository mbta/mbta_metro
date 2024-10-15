defmodule MbtaMetro.Live.Map do
  @moduledoc """
  A live component that renders a map using [Stadia](https://stadiamaps.com).

  You must pass in the following assigns:

    * `:api_key` - The AWS Location Service API key.

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
    assigns
    |> Map.get(:class, "")
    |> Kernel.then(&assign(assigns, :class, &1))
    |> Map.get(:click_handler, false)
    |> Kernel.then(&assign(assigns, :click_handler, &1))

    ~H"""
    <div
      id="map"
      class={@class}
      data-api-key={@api_key}
      data-click-handler={Jason.encode!(@click_handler)}
      phx-hook="Map"
    >
    </div>
    """
  end
end
