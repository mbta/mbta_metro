defmodule MbtaMetroWeb.Router do
  @moduledoc false

  use MbtaMetroWeb, :router

  import Phoenix.LiveView.Router
  import PhoenixStorybook.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {MbtaMetroWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/" do
    storybook_assets()
  end

  scope "/", MbtaMetroWeb do
    pipe_through(:browser)

    get("/_health", HealthController, :index)
    live("/demo", Live.Demo)
    live_storybook("/storybook", backend_module: MbtaMetroWeb.Storybook)
  end
end
