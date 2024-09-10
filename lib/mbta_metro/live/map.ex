defmodule MbtaMetro.Live.Map do
  @moduledoc """
  The map live component.
  """

  use Phoenix.LiveComponent

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :markers, [])}
  end

  def render(assigns) do
    ~H"""
    <div class="h-96 w-96" id="map" phx-hook="Map" phx-update="ignore">
    </div>
    """
  end

  def handle_event("map-clicked", payload, socket) do
    IO.inspect(payload)

    {:noreply, socket}
  end
end
