defmodule Mix.Tasks.MbtaMetro.InstallFonts do
  @moduledoc "Copies fonts from MbtaMetro to the priv/static/fonts directory"
  @shortdoc "Copies MbtaMetro fonts"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    dir = File.cwd!()

    System.cmd("cp", ["-r", "#{dir}/deps/mbta_metro/priv/static/fonts/.", "#{dir}/priv/static/fonts"])
  end
end
