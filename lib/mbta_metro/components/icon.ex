defmodule MbtaMetro.Components.Icon do
  @moduledoc """
  A component that renders an SVG icon, from FontAwesome, a bespoke Metro collection, or
  a custom collection provided by the client.

  An icon can be pulled in like
  ```heex
  <.icon type="solid" name="thumbs-up" class="size-6" />
  ```

  `type` indicates which icon pack the icon comes from, `name` indicates the specific icon.
  Other properties (including `class`) are passed directly to the `svg` component.

  See `icon/1` for more information.
  """

  require Logger

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
    # --- compile time only ---
    {:ok, parsed} = Floki.parse_fragment(file)
    [{"svg", svg_attrs, svg_content}] = Floki.find(parsed, "svg")
    inner_html = Floki.raw_html(svg_content)

    # Convert the static svg attrs into the SAME iodata shape opts_to_attrs/1
    # produces, so both lists can just be concatenated at runtime with no
    # per-request formatting work.
    svg_attrs_iodata =
      for {key, value} <- svg_attrs do
        [?\s, key, ?=, ?", Phoenix.HTML.Safe.to_iodata(value), ?"]
      end

    defp icon(unquote(type), unquote(name), opts) do
      attrs = opts_to_attrs(opts) ++ unquote(svg_attrs_iodata)
      {:safe, [?<, "svg", attrs, ?>, unquote(inner_html), "</svg>"]}
    end
  end

  defp icon(_, _, _), do: nil

  attr :name, :string, required: true
  attr :opts, :global, default: %{}
  attr :type, :string, values: @types, default: "solid"

  def icon(assigns) do
    ~H"""
    {icon(@type, @name, @opts)}
    """
  end

  defp opts_to_attrs(opts) do
    for {key, value} <- opts do
      key =
        key
        |> Atom.to_string()
        |> String.replace("_", "-")
        |> Phoenix.HTML.Safe.to_iodata()

      value = Phoenix.HTML.Safe.to_iodata(value)

      [?\s, key, ?=, ?", value, ?"]
    end
  end
end
