defmodule Mix.Tasks.MbtaMetro.ExportAssets do
  @moduledoc "Copies CSS and Icons to the priv/static directory"

  @shortdoc "Copies CSS and Icons"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    export_css()
    export_icons()
  end

  defp export_css do
    dir = File.cwd!()

    Esbuild.run(:components, [])

    System.cmd("cp", [
      "#{dir}/assets/css/default.css",
      "#{dir}/priv/static/assets/default.css"
    ])

    System.cmd("cat", [
      "#{dir}/priv/static/assets/components.css",
      ">>",
      "#{dir}/priv/static/assets/default.css"
    ])
  end

  defp export_icons do
    dir = File.cwd!()

    System.cmd("cp", [
      "-r",
      "#{dir}/assets/node_modules/@fortawesome/fontawesome-free/svgs/*",
      "#{dir}/priv/static/icons"
    ])
  end
end
