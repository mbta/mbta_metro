defmodule Mix.Tasks.MbtaMetro.UpdateAssets do
  @moduledoc "Updates the assets of MbtaMetro based on the version"
  @shortdoc "Updates MbtaMetro's assets"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    version = version()

    File.cd!("assets", fn ->
      "npm install --save mbta_metro@#{version}"
      Kernel.to_charlist()
      :os.cmd()
    end)
  end

  defp version do
    File.read!("VERSIONS")
    |> String.split("\n", trim: true)
    |> List.last()
    |> String.split("-")
    |> List.last()
  end
end
