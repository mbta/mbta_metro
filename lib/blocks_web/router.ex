defmodule BlocksWeb.Router do
  use Phoenix.Router, helpers: false

  import Phoenix.LiveView.Router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:put_root_layout, {BlocksWeb.Layouts, :root})
  end

  scope "/", BlocksWeb do
    pipe_through(:browser)

    live "/", Live.Demo
  end
end
