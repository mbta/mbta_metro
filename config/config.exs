import Config

config :logger, level: :info

config :mbta_metro, :map, api_key: System.get_env("MBTA_METRO_MAP_API_KEY")

config :mbta_metro, custom_icons: "#{File.cwd!()}/priv/static/test/icons/custom/*.svg"

import_config "#{config_env()}.exs"
