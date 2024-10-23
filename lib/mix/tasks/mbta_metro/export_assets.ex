defmodule Mix.Tasks.MbtaMetro.ExportAssets do
  @moduledoc "Exports assets to the priv/static directory"

  @shortdoc "Exports assets"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    export_css()
    export_icons()
  end

  defp export_css do
    dir = File.cwd!()

    Esbuild.run(:components, [])

    "cp #{dir}/assets/css/default.css #{dir}/priv/static/assets/default.css"
    |> Kernel.to_charlist()
    |> :os.cmd()

    "cat #{dir}/priv/static/assets/components.css >> #{dir}/priv/static/assets/default.css"
    |> Kernel.to_charlist()
    |> :os.cmd()
  end

  defp export_icons do
    dir = File.cwd!()

    System.cmd("cp", [
      "-r",
      "#{dir}/assets/node_modules/@fortawesome/fontawesome-free/svgs/.",
      "#{dir}/priv/static/icons"
    ])
  end
end
