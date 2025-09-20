defmodule MbtaMetro.MixProject do
  use Mix.Project

  def project do
    [
      app: :mbta_metro,
      aliases: aliases(),
      compilers: Mix.compilers(),
      deps: deps(),
      description: "A Phoenix LiveView component library",
      docs: docs(),
      elixir: "~> 1.17",
      elixirc_paths: elixirc_paths(Mix.env()),
      listeners: [Phoenix.CodeReloader],
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
    [mod: {MbtaMetro.Application, []}]
  end

  defp aliases() do
    [
      prepare: ["assets.build", "mbta_metro.version"],
      "assets.build": [
        "esbuild tailwindpreset",
        "esbuild metro",
        "tailwind metro"
      ]
    ]
  end

  defp deps do
    if is_metro_app?() do
      [
        {:bandit, "~> 1.7", only: :dev, optional: true, runtime: false},
        {:cva, "~> 0.2"},
        {:esbuild, "~> 0.10", only: :dev, runtime: false},
        {:ex_doc, "~> 0.38", only: :dev, runtime: false},
        {:faker, "~> 0.18", only: [:dev, :test], runtime: false},
        {:floki, "~> 0.38"},
        {:heroicons, "~> 0.5", optional: true},
        {:jason, "~> 1.4"},
        {:phoenix_live_reload, "~> 1.6", only: :dev, optional: true, runtime: false},
        {:phoenix_storybook, "0.9.3"},
        {:tailwind, "~> 0.3", only: :dev, optional: true, runtime: false},
        {:timex, "~> 3.7"}
      ]
    else
      [
        {:cva, "~> 0.2"},
        {:floki, "~> 0.38"},
        {:jason, "~> 1.4"},
        {:timex, "~> 3.7"}
      ]
    end
  end

  defp docs do
    [
      main: "MbtaMetro",
      canonical: "http://hexdocs.pm/mbta_metro",
      extras: ["README.md"],
      logo: "priv/static/icons/brands/metro.svg",
      source_url: "https://github.com/mbta/mbta_metro",
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

  # We don't want to compile the mbta_metro_web directory when mbta_metro is being run in another app.
  defp elixirc_paths(_) do
    if is_metro_app?() do
      ["lib", "storybook"]
    else
      [
        "lib/mbta_metro.ex",
        "lib/mbta_metro/gettext.ex",
        "lib/mbta_metro/utils.ex",
        "lib/mbta_metro/components/",
        "lib/mbta_metro/live/"
      ]
    end
  end

  defp package do
    [
      files: [
        "lib/mbta_metro.ex",
        "lib/mbta_metro/components/**/*",
        "lib/mbta_metro/live/**/*",
        "lib/mbta_metro/gettext.ex",
        "lib/mbta_metro/utils.ex",
        "mix.exs",
        "priv/fonts/*",
        "priv/icons/*",
        "priv/dist/*",
        "README.md",
        "VERSION"
      ],
      licenses: ["GPL-3.0-or-later"],
      links: %{"GitHub" => "https://github.com/mbta/mbta_metro"}
    ]
  end

  defp version do
    File.read!("VERSION")
    |> String.trim()
  end

  # Load different things if this application's a dependency of another project
  defp is_metro_app? do
    app = Mix.Project.config()[:app]
    is_nil(app) or app == :mbta_metro
  end
end
