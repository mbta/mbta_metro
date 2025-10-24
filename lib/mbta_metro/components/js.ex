defmodule MbtaMetro.Components.JS do
  @moduledoc false

  def show(js \\ %Phoenix.LiveView.JS{}, selector) do
    Phoenix.LiveView.JS.show(js,
      to: selector,
      transition: {"mbta-js--show", "mbta-js-transition--start", "mbta-js-transition--end"}
    )
  end

  def hide(js \\ %Phoenix.LiveView.JS{}, selector) do
    Phoenix.LiveView.JS.hide(js,
      to: selector,
      time: 2200,
      transition: {"mbta-js--hide", "mbta-js-transition--end", "mbta-js-transition--start"}
    )
  end
end
