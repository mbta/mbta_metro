import Config

config :mbta_metro, MbtaMetroWeb.Endpoint,
  adapter: Bandit.PhoenixAdapter,

  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  live_view: [signing_salt: "F_IrwXSetja22gAl"],
  pubsub_server: MbtaMetro.PubSub,
  secret_key_base: "TcvJhq/n8JgjzZJ38tbZcFDrS2htRxPYvQNpKiqPulT+XFCsoQmxRlr9VWDYc912",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:mbta_metro, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:mbta_metro, ~w(--watch)]}
  ]

config :mbta_metro, MbtaMetroWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"lib/mbta_metro_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

config :esbuild,
  version: "0.17.11",
  mbta_metro: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.4.0",
  mbta_metro: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

config :phoenix, :json_library, Jason

config :logger, level: :info
