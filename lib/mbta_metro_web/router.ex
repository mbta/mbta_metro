defmodule MbtaMetroWeb.Router do
  use Phoenix.Router, helpers: false

  import Phoenix.LiveView.Router

  live "/", MbtaMetroWeb.Live.Demo
end
