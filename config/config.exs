import Config

config :logger, level: :info

config :mbta_metro, :map, api_key: System.get_env("MBTA_METRO_MAP_API_KEY")

import_config "#{config_env()}.exs"
