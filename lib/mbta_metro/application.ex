defmodule MbtaMetro.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, name: MbtaMetro.PubSub},
      MbtaMetroWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: MbtaMetro.Supervisor]

    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    MbtaMetroWeb.Endpoint.config_change(changed, removed)

    :ok
  end
end
