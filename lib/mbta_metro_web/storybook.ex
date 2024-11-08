defmodule MbtaMetroWeb.Storybook do
  @moduledoc false

  use PhoenixStorybook,
    otp_app: :mbta_metro_web,
    content_path: Path.expand("../../storybook", __DIR__),
    # assets path are remote path, not local file-system paths
    css_path: "/assets/app.css",
    js_path: "/assets/app.js",
    sandbox_class: "mbta-metro-web",
    title: "Mbta Metro"
end
