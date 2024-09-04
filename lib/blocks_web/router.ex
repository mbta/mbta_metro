defmodule BlocksWeb.Router do
  use BlocksWeb, :router

  import Phoenix.LiveView.Router

  live "/", BlocksWeb.Live.Demo
end
