defmodule MbtaMetroWeb.Live.Demo do
  @moduledoc false

  use MbtaMetroWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, show: true)}
  end

  def handle_event("click", _, socket) do
    {:noreply, assign(socket, show: false)}
  end
end
