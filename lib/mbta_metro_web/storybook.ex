defmodule MbtaMetroWeb.Storybook do
  @moduledoc false

  use PhoenixStorybook,
    otp_app: :mbta_metro,
    content_path: Path.expand("../../storybook", __DIR__),
    # assets path are remote path, not local file-system paths
    css_path: "/assets/storybook.css",
    js_path: "/assets/storybook.js",
    sandbox_class: "mbta-metro-web",
    title: "Mbta Metro",

    # Keep attributes & slot documentations in component page header.
    strip_doc_attributes: false
end
