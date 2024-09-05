import Config

config :logger, level: :info

config :blocks, BlocksWeb.Endpoint,
  adapter: Bandit.PhoenixAdapter,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "TcvJhq/n8JgjzZJ38tbZcFDrS2htRxPYvQNpKiqPulT+XFCsoQmxRlr9VWDYc912",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:blocks, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:blocks, ~w(--watch)]}
  ],
  live_view: [signing_salt: "F_IrwXSetja22gAl"]

config :esbuild,
  version: "0.17.11",
  blocks: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.4.0",
  blocks: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]
