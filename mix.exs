defmodule MbtaMetro.MixProject do
  use Mix.Project

  @version "0.0.1-alpha"

  def project do
    [
      app: :mbta_metro,
      version: @version,
      elixir: "~> 1.17",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      name: "MbtaMetro",
      description: "A Phoenix LiveView component library",
      docs: [
        main: "MbtaMetro",
        canonical: "http://hexdocs.pm/mbta_metro",
        source_url: "https://github.com/anthonyshull/mbta_metro",
        source_ref: "v#{@version}"
      ],
      package: [
        licenses: ["GPL-3.0-or-later"],
        links: %{"GitHub" => "https://github.com/anthonyshull/mbta_metro"}
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {MbtaMetro.Application, []}
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
      {:bandit, "1.5.7", only: :dev, optional: true, runtime: false},
      {:esbuild, "0.8.1", only: :dev, optional: true, runtime: Mix.env() == :dev},
      {:heroicons, "0.5.6", runtime: false},
      {:phoenix, "1.7.14"},
      {:phoenix_live_reload, "1.5.3", only: :dev, optional: true, runtime: false},
      {:phoenix_live_view, "1.0.0-rc.6"},
      {:tailwind, "0.2.3", only: :dev, optional: true, runtime: Mix.env() == :dev}
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
