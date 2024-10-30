defmodule MbtaMetro.Components.Icon do
  @moduledoc false

  use Phoenix.Component

  alias MbtaMetro.Utils

  @custom_icon_paths Application.compile_env(:mbta_metro, :custom_icons, nil)

  custom_icon_paths =
    if @custom_icon_paths == nil, do: [], else: @custom_icon_paths |> Path.wildcard()

  icon_paths =
    "#{Utils.project_root()}/priv/static/icons/**/*.svg"
    |> Path.wildcard()

  icons =
    Enum.map(custom_icon_paths ++ icon_paths, fn icon_path ->
      [type, name] = icon_path |> Path.split() |> Enum.take(-2)

      {File.read!(icon_path), Path.rootname(name), type}
    end)

  names = icons |> Enum.map(&Kernel.elem(&1, 1)) |> Enum.uniq()
  types = icons |> Enum.map(&Kernel.elem(&1, 2)) |> Enum.uniq()

  @icons icons
  @names names
  @types types

  def icons, do: @icons
  def names, do: @names
  def types, do: @types

  for {file, name, type} <- icons do
    defp icon(unquote(type), unquote(name), class) do
      attrs =
        [
          ?\s,
          Phoenix.HTML.Safe.to_iodata("class"),
          ?=,
          ?",
          Phoenix.HTML.Safe.to_iodata(class),
          ?"
        ]

      "<svg" <> rest = unquote(file)

      Phoenix.HTML.raw(["<svg", attrs, rest])
    end
  end

  defp icon(_, _, _), do: nil

  attr :class, :string, default: ""
  attr :name, :string, required: true
  attr :type, :string, values: @types, default: "solid"

  def icon(assigns) do
    ~H"""
    <%= icon(@type, @name, @class) %>
    """
  end
end
