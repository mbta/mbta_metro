[
  import_deps: [:cva, :phoenix],
  inputs: ["*.{ex,exs}", "{config,lib,test}/**/*.{ex,exs,heex}", "storybook/**/*.exs"],
  plugins: [Phoenix.LiveView.HTMLFormatter]
]
