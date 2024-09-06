defmodule MbtaMetro.MixProject do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      app: :mbta_metro,
      version: @version,
      elixir: "~> 1.17",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      package: [
        licenses: ["GPL-3.0-or-later"],
        links: %{"GitHub" => "https://github.com/anthonyshull/mbta_metro"}
      ],
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {MbtaMetro.Application, []},
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:bandit, "1.5.7", runtime: false},
      {:esbuild, "0.8.1", runtime: Mix.env() == :dev},
      {:heroicons,
       github: "tailwindlabs/heroicons",
       tag: "v2.1.1",
       sparse: "optimized",
       app: false,
       compile: false,
       depth: 1,
       runtime: false},
      {:phoenix, "1.7.14"},
      {:phoenix_live_view, "0.20.17"},
      {:tailwind, "0.2.3", runtime: Mix.env() == :dev},
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "assets.setup", "assets.build"],
      "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      "assets.build": ["tailwind mbta_metro", "esbuild mbta_metro"],
      "assets.deploy": [
        "tailwind mbta_metro --minify",
        "esbuild mbta_metro --minify",
        "phx.digest"
      ]
    ]
  end
end
