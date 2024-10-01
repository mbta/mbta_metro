defmodule Mix.Tasks.MbtaMetro.CopyCss do
  @moduledoc "Copies the default.css file to the priv/static/assets directory"
  @shortdoc "Copies default.css"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    dir = File.cwd!()

    System.cmd("cp", ["#{dir}/assets/css/default.css", "#{dir}/priv/static/assets/default.css"])
  end
end
