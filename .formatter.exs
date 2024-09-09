[
  import_deps: [:phoenix],
  inputs: ["*.{ex,exs}", "{config,lib,test}/**/*.{ex,exs,heex}"],
  plugins: [Phoenix.LiveView.HTMLFormatter]
]
