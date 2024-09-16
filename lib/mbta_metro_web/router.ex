defmodule MbtaMetroWeb.Router do
  @moduledoc false

  use Phoenix.Router, helpers: false

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

    live_storybook("/storybook", backend_module: MbtaMetroWeb.Storybook)
  end
end
