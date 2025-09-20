import Config

config :mbta_metro, MbtaMetroWeb.Endpoint,
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  url: [host: "localhost"],
  http: [ip: {127, 0, 0, 1}, port: 4000],
  secret_key_base: "TcvJhq/n8JgjzZJ38tbZcFDrS2htRxPYvQNpKiqPulT+XFCsoQmxRlr9VWDYc912",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:storybook, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:storybook, ~w(--watch)]}
  ],
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$"
      # ~r"lib/mbta_metro_web/(live|views)/.*(ex)$",
      # ~r"lib/mbta_metro_web/templates/.*(eex)$"
    ]
  ]
