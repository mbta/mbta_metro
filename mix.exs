defmodule MbtaMetro.MixProject do
  use Mix.Project

  @version "0.0.8"

  def project do
    [
      app: :mbta_metro,
      aliases: aliases(),
      deps: deps(),
      description: "A Phoenix LiveView component library",
      docs: docs(),
      elixir: "~> 1.17",
      elixirc_paths: elixirc_paths(Mix.env()),
      name: "MbtaMetro",
      package: package(),
      start_permanent: Mix.env() == :prod,
      version: @version
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    if Mix.env() == :prod do
      []
    else
      [mod: {MbtaMetro.Application, []}]
    end
  end

  defp aliases do
    [
      setup: ["deps.get", "assets.setup", "assets.build"],
      "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      "assets.build": ["tailwind storybook", "esbuild storybook", "mbta_metro.copy_css"],
      "assets.deploy": [
        "tailwind storybook --minify",
        "esbuild storybook --minify",
        "mbta_metro.copy_css",
        "phx.digest"
      ]
    ]
  end

  defp deps do
    [
      {:bandit, "1.5.7", only: :dev, optional: true, runtime: false},
      {:esbuild, "0.8.1", only: :dev, optional: true, runtime: Mix.env() == :dev},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:faker, "0.18.0", only: :dev, runtime: false},
      {:heroicons, "0.5.6"},
      {:phoenix, "1.7.14"},
      {:phoenix_live_reload, "1.5.3", only: :dev, optional: true, runtime: false},
      {:phoenix_live_view, "1.0.0-rc.6"},
      {:phoenix_storybook, "0.6.4"},
      {:tailwind, "0.2.3", only: :dev, optional: true, runtime: Mix.env() == :dev}
    ]
  end

  defp docs do
    [
      main: "MbtaMetro",
      canonical: "http://hexdocs.pm/mbta_metro",
      extras: ["README.md"],
      source_url: "https://github.com/anthonyshull/mbta_metro",
      source_ref: "v#{@version}"
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      files: [
        "lib/mbta_metro.ex",
        "lib/mbta_metro/components/**/*",
        "lib/mbta_metro/live/**/*",
        "lib/mix/tasks/mbta_metro/install_*.ex",
        "mix.exs",
        "priv/static/assets/default.css",
        "priv/static/fonts/*",
        "priv/static/images/icon-mode-*.svg",
        "README.md"
      ],
      licenses: ["GPL-3.0-or-later"],
      links: %{"GitHub" => "https://github.com/anthonyshull/mbta_metro"}
    ]
  end
end
