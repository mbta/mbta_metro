import Config

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
        "tiles" => ["https://mbta-map-tiles-dev.s3.amazonaws.com/osm_tiles/{z}/{x}/{y}.png"],
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

import_config "#{config_env()}.exs"
