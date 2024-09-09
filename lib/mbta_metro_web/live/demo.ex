defmodule MbtaMetroWeb.Live.Demo do
  @moduledoc false

  use MbtaMetroWeb, :live_view

  def mount(_params, _session, socket) do
    form = Phoenix.Component.to_form(%{"fruit" => ["apple", "banana", "coconut", "durian"]})
    {:ok, assign(socket, show: true, form: form)}
  end

  def handle_event("click", _, socket) do
    {:noreply, assign(socket, show: false)}
  end
end
