defmodule Mix.Tasks.MbtaMetro.CopyFonts do
  @moduledoc "Copies fonts from MbtaMetro to the priv/static/fonts directory"
  @shortdoc "Copies MbtaMetro fonts"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    System.cmd("cp", ["./deps/mbta_metro/priv/static/fonts/*", "./priv/static/fonts"])
  end
end
