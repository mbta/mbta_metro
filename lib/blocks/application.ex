defmodule Blocks.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BlocksWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Blocks.Supervisor]

    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    BlocksWeb.Endpoint.config_change(changed, removed)

    :ok
  end
end
