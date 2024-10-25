defmodule MbtaMetro.MixProject do
  use Mix.Project

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
      version: version()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    if Mix.env() == :dev do
      [mod: {MbtaMetro.Application, []}]
    else
      []
    end
  end

  defp aliases() do
    [
      prepare: ["mbta_metro.export_assets", "mbta_metro.version"]
    ]
  end

  defp deps do
    [
      {:bandit, "1.5.7", only: :dev, optional: true, runtime: false},
      {:esbuild, "0.8.1", only: :dev, optional: true, runtime: Mix.env() == :dev},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:faker, "0.18.0", only: :dev, runtime: false},
      {:jason, "1.4.4"},
      {:heroicons, "0.5.6", optional: true},
      {:phoenix, "1.7.14"},
      {:phoenix_live_reload, "1.5.3", only: :dev, optional: true, runtime: false},
      {:phoenix_live_view, "1.0.0-rc.6"},
      {:phoenix_storybook, "0.6.4"},
      {:tailwind, "0.2.3", only: :dev, optional: true, runtime: Mix.env() == :dev},
      {:timex, "3.7.11"}
    ]
  end

  defp docs do
    [
      main: "MbtaMetro",
      canonical: "http://hexdocs.pm/mbta_metro",
      extras: ["README.md"],
      logo: "priv/static/icons/brands/metro.svg",
      source_url: "https://github.com/anthonyshull/mbta_metro",
      source_ref: "v#{version()}"
    ]
  end

  # Specifies which paths to compile per environment.
  # In test, we only want to compile the function and live components (and utils).
  defp elixirc_paths(:test) do
    [
      "lib/mbta_metro/components",
      "lib/mbta_metro/live",
      "lib/mbta_metro/utils.ex"
    ]
  end

  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      files: [
        "lib/mbta_metro.ex",
        "lib/mbta_metro/components/**/*",
        "lib/mbta_metro/live/**/*",
        "lib/mbta_metro/utils.ex",
        "lib/mix/tasks/mbta_metro/update_*.ex",
        "mix.exs",
        "priv/static/assets/default.css",
        "priv/static/fonts/*",
        "priv/static/icons/*",
        "README.md",
        "VERSION"
      ],
      licenses: ["GPL-3.0-or-later"],
      links: %{"GitHub" => "https://github.com/anthonyshull/mbta_metro"}
    ]
  end

  defp version do
    File.read!("VERSION")
    |> String.trim()
  end
end
