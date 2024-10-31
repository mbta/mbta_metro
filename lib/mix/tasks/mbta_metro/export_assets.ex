defmodule Mix.Tasks.MbtaMetro.ExportAssets do
  @moduledoc "Exports assets to the priv/static directory"

  @shortdoc "Exports assets"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    export_css()
    export_fontawesome_icons()
    export_metro_icons()
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

  defp export_fontawesome_icons do
    dir = File.cwd!()

    System.cmd("cp", [
      "-r",
      "#{dir}/assets/node_modules/@fortawesome/fontawesome-free/svgs/.",
      "#{dir}/priv/static/icons"
    ])
  end

  defp export_metro_icons do
    path =
      "#{File.cwd!()}/assets/node_modules/@fortawesome/fontawesome-free/svgs/solid/location-pin.svg"

    svg =
      File.read!(path) |> String.replace("512", "1024") |> String.replace_trailing("</svg>", "")

    for letter <- ~w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do
      icon_path =
        "#{File.cwd!()}/priv/static/icons/metro/location-pin-#{String.downcase(letter)}.svg"

      icon_text =
        "<text x='50%' y='244' dominant-baseline='middle' text-anchor='middle' font-size='240' fill='white' font-family='Inter'>#{letter}</text>"

      File.write!(icon_path, svg <> icon_text <> "</svg>")
    end
  end
end
