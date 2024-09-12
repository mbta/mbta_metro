defmodule MbtaMetroWeb.Live.Demo do
  @moduledoc false

  use MbtaMetroWeb, :live_view

  def mount(_params, _session, socket) do
    form = Phoenix.Component.to_form(%{"fruit" => ["apple", "banana", "coconut", "durian"]})
    api_key = Application.get_env(:mbta_metro, :aws_location)[:api_key]
    map_name = Application.get_env(:mbta_metro, :aws_location)[:map_name]
    region = Application.get_env(:mbta_metro, :aws_location)[:region]

    {:ok, assign(socket, api_key: api_key, map_name: map_name, region: region, form: form)}
  end

  def handle_event("map-clicked", payload, socket) do
    IO.inspect(payload)

    {:noreply, socket}
  end
end
