defmodule BlocksWeb.Router do
  use Phoenix.Router, helpers: false

  import Phoenix.LiveView.Router

  live "/", BlocksWeb.Live.Demo
end
