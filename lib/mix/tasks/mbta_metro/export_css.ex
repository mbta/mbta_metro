defmodule Mix.Tasks.MbtaMetro.ExportCss do
  @moduledoc "Copies the default.css file to the priv/static/assets directory"
  @shortdoc "Copies default.css"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    dir = File.cwd!()

    Esbuild.run(:components, [])

    "cp #{dir}/assets/css/default.css #{dir}/priv/static/assets/default.css"
    |> Kernel.to_charlist()
    |> :os.cmd()

    "cat #{dir}/priv/static/assets/components.css >> #{dir}/priv/static/assets/default.css"
    |> Kernel.to_charlist()
    |> :os.cmd()
  end
end
