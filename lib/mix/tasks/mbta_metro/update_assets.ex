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
    version = version()

    File.cd!("assets", fn ->
      "npm install --save mbta_metro@#{version}"
      |> Kernel.to_charlist()
      |> :os.cmd()
    end)
  end

  defp version do
    File.read!("deps/mbta_metro/VERSION")
    |> String.trim()
  end
end
