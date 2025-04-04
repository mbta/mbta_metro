import Config

config :mbta_metro, MbtaMetroWeb.Endpoint,
  adapter: Bandit.PhoenixAdapter,
  pubsub_server: MbtaMetro.PubSub,
  live_view: [signing_salt: "F_IrwXSetja22gAl"],
  secret_key_base: "TcvJhq/n8JgjzZJ38tbZcFDrS2htRxPYvQNpKiqPulT+XFCsoQmxRlr9VWDYc912"

config :logger, level: :info

# Raster style maps
config :mbta_metro, :map, %{
  center: [-71.0589, 42.3601],
  maxZoom: 16,
  style: %{
    "version" => 8,
    "sources" => %{
      "raster-tiles" => %{
        "type" => "raster",
        "tiles" => ["https://cdn.mbta.com/osm_tiles/{z}/{x}/{y}.png"],
        "tileSize" => 256,
        "attribution" =>
          "&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap</a>"
      }
    },
    "layers" => [
      %{
        "id" => "mbta-tiles",
        "type" => "raster",
        "source" => "raster-tiles",
        "minzoom" => 9,
        "maxzoom" => 18
      }
    ]
  },
  zoom: 14
}

config :mbta_metro, custom_icons: "#{File.cwd!()}/priv/static/test/icons/custom/*.svg"

config :esbuild,
  version: "0.25.9",
  storybook: [
    args: ~w(js/storybook.js --bundle --minify --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ],
  tokens: [
    args: ~w(js/tokens.js --outdir=../priv/dist),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ],
  metro: [
    args: ~w(js/metro.js --bundle --target=es2020 --format=cjs  --outdir=../priv/dist --minify),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ],
  metrocss: [
    args: ~w(css/metro.css --bundle --outdir=../priv/dist --external:../fonts/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.4.17",
  storybook: [
    args: ~w(
      --input=css/storybook.css
      --output=../priv/static/assets/storybook.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

import_config "#{config_env()}.exs"
