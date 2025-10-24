defmodule MbtaMetroWeb.Storybook do
  @moduledoc false

  use PhoenixStorybook,
    otp_app: :mbta_metro,
    content_path: Path.expand("../../storybook", __DIR__),
    # assets path are remote path, not local file-system paths
    css_path: "/assets/app.css",
    js_path: "/assets/app.js",
    sandbox_class: "mbta-metro-web",
    title: "Mbta Metro",
    color_mode: true,
    color_mode_sandbox_dark_class: "mbta-metro-dark-mode",

    # Keep attributes & slot documentations in component page header.
    strip_doc_attributes: false
end
