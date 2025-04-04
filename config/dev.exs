import Config

config :mbta_metro, MbtaMetroWeb.Endpoint,
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:storybook, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:storybook, ~w(--watch)]}
  ]

config :mbta_metro, MbtaMetroWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"lib/mbta_metro_web/(controllers|live|components)/.*(ex|heex)$",
      ~r"storybook/.*(ex|exs)$"
    ]
  ]
