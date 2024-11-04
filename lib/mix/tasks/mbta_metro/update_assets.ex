defmodule Mix.Tasks.MbtaMetro.UpdateAssets do
  @moduledoc "Updates the assets of MbtaMetro based on the version"
  @shortdoc "Updates MbtaMetro's assets"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    update_fonts()
    update_npm()
  end

  defp update_fonts do
    dir = File.cwd!()

    System.cmd("cp", [
      "-r",
      "#{dir}/deps/mbta_metro/priv/static/fonts/.",
      "#{dir}/priv/static/fonts"
    ])
  end

  defp update_npm do
    File.cd!("assets", fn ->
      "npm install -S -install-links ../deps/mbta_metro/priv/"
      |> Kernel.to_charlist()
      |> :os.cmd()
    end)
  end
end
