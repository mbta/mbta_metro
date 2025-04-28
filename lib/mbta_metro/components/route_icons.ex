defmodule MbtaMetro.Components.SystemIcons do
  @moduledoc false

  use Gettext, backend: MbtaMetro.Gettext
  use Phoenix.Component

  import CVA, only: [cva: 2]
  import MbtaMetro.Components.Icon, only: [icon: 1]

  @lines_using_icon_modifiers [
    "green-line-b",
    "green-line-c",
    "green-line-d",
    "green-line-e",
    "mattapan-line"
  ]

  @supported_lines [
    "red-line",
    "mattapan-line",
    "green-line",
    "green-line-b",
    "green-line-c",
    "green-line-d",
    "green-line-e",
    "orange-line",
    "blue-line",
    "silver-line"
  ]

  def supported_lines, do: @supported_lines

  @doc """
  An icon for depicting an MBTA route, with compact options.

  <iframe style="border: 1px solid rgba(0, 0, 0, 0.1);" width="800" height="350" src="https://embed.figma.com/design/IupfoRXJNItGDD8ZaZCxDz/branch/lMS9vgBPCx0HLbDqONQlha/MBTA-Rider-Design-System-Components?m=auto&node-id=2483-821&embed-host=share" allowfullscreen></iframe>
  """
  attr :class, :string, default: ""
  attr :line, :string, values: @supported_lines
  attr :name, :string, examples: ["SL1", "1", "111", "39"]
  attr :size, :string, default: "default", values: ["default", "small"]

  def route_icon(%{line: line} = assigns) when line in @supported_lines do
    assigns =
      assigns
      |> assign(
        :combined_class,
        Enum.join([cva_class(:route_icon, assigns), color_class(assigns.line)], " ")
      )
      |> assign(:label, label(assigns.line))
      |> assign(:line_initials, line_initials(assigns.line))

    if assigns.line in @lines_using_icon_modifiers do
      if assigns.size == "small" do
        ~H"""
        <.icon
          type="system"
          name={"modifier-#{modifier(@line)}-small"}
          height={icon_size("small")}
          aria-label={@label}
          class={"rounded-full inline #{@class}"}
        />
        """
      else
        ~H"""
        <span
          class={"inline-flex flex-nowrap items-center leading-[0.875em] #{spacing_class(@size)}"}
          aria-label={@label}
        >
          <.route_pill class={@combined_class} aria-hidden="true">
            {@line_initials}
          </.route_pill>
          <.icon
            type="system"
            name={"modifier-#{modifier(@line)}-default"}
            height={icon_size("default")}
            aria-hidden="true"
            class="rounded-full inline ring-2 ring-white"
          />
        </span>
        """
      end
    else
      ~H"""
      <.route_pill class={@combined_class} aria-label={@label}>
        {@line_initials}
      </.route_pill>
      """
    end
  end

  # alternately, supply route name. assumes bus
  def route_icon(%{name: _} = assigns) do
    assigns =
      assign(
        assigns,
        :class,
        [
          if(String.starts_with?(assigns.name, "SL"),
            do: color_class("silver-line"),
            else: color_class("bus")
          ),
          cva_class(:route_icon, assigns),
          "px-[0.5em]"
        ]
        |> Enum.join(" ")
      )

    ~H"""
    <.route_pill class={@class}>{@name}</.route_pill>
    """
  end

  def route_icon(assigns), do: ~H"<span />"

  @doc """
  Several route icons shown together.
  """
  attr :class, :string, default: ""
  attr :lines, :list, required: false, doc: "Valid values include #{inspect(@supported_lines)}"
  attr :names, :list

  def stacked_route_icon(%{lines: [line]} = assigns) when line in @supported_lines do
    assigns = assign(assigns, :line, line)

    ~H"""
    <.route_icon {assigns} />
    """
  end

  def stacked_route_icon(%{lines: [_ | _]} = assigns) do
    cond do
      Enum.all?(assigns.lines, &String.starts_with?(&1, "green-line")) ->
        assigns = assign(assigns, :branches, green_branches(assigns.lines))

        ~H"""
        <span class={"flex flex-nowrap items-center leading-[0.875em] #{spacing_class("default")}"}>
          <.route_icon line="green-line" class={@class} />
          <span class="-space-x-0.5">
            <.icon
              :for={branch <- @branches}
              type="system"
              name={"modifier-#{branch}-default"}
              height="1.5rem"
              class="inline rounded-full ring-2 ring-white"
            />
          </span>
        </span>
        """

      "mattapan-line" in assigns.lines ->
        assigns = assign(assigns, :lines, ["mattapan-line"])

        ~H"""
        <.stacked_route_icon {assigns} />
        """

      true ->
        ~H"""
        <span class={"flex flex-nowrap items-center leading-[0.875em]  #{spacing_class("default")}"}>
          <.route_icon :for={line <- @lines} line={line} class={"#{@class} ring-2 ring-white"} />
        </span>
        """
    end
  end

  def stacked_route_icon(%{names: _} = assigns) do
    assigns =
      assign(
        assigns,
        :class,
        "#{assigns.class} !px-[0.75em] [&:not(:first-child)]:rounded-l-none [&:not(:last-child)]:rounded-r-none"
      )

    ~H"""
    <span class="flex flex-nowrap items-center -space-x-0.5 leading-[0.875em]">
      <%= for {name, index} <- Enum.with_index(@names) do %>
        <.route_icon name={name} class={@class} />
        <span
          :if={index < Kernel.length(@names) - 1}
          class={"bg-white -mt-0.5 w-1 h-8 z-#{50 - index * 10} transform rotate-[10deg]"}
          aria-label="or"
        />
      <% end %>
    </span>
    """
  end

  def stacked_route_icon(assigns), do: ~H"<span />"

  @valid_modes ["subway", "bus", "commuter-rail", "ferry", "the-ride"]

  attr :class, :string, default: "inline"
  attr :mode, :string, required: true, values: @valid_modes
  attr :size, :string, default: "default", values: ["default", "small"]

  @doc """
  A round icon depicting a mode of transit. Supported modes: #{inspect(@valid_modes)}

  <iframe style="border: 1px solid rgba(0, 0, 0, 0.1);" width="800" height="350" src="https://embed.figma.com/design/IupfoRXJNItGDD8ZaZCxDz/branch/lMS9vgBPCx0HLbDqONQlha/MBTA-Rider-Design-System-Components?m=auto&node-id=2483-821&embed-host=share" allowfullscreen></iframe>
  """
  def mode_icon(assigns) do
    assigns = assign(assigns, :class, cva_class(:mode_icon, assigns))

    ~H"""
    <.icon type="system" class={@class} name={"mode-#{@mode}-#{@size}"} aria-label={label(@mode)} />
    """
  end

  attr :class, :string, default: ""
  attr :rest, :global
  slot :inner_block, required: true

  defp route_pill(assigns) do
    ~H"""
    <span
      class={"text-nowrap font-helvetica font-bold inline-flex justify-center rounded-full px-[0.25em] pt-[0.25em] pb-[0.3125em] leading-[0.875em] #{@class}"}
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end

  defp cva_class(:route_icon, assigns) do
    cva(
      [
        variants: [
          size: [
            # minimum 50px wide
            default: "text-base min-w-[3.125em]",
            # minimum 28px wide
            small: "text-sm min-w-[2em]"
          ]
        ],
        default_variants: [size: "default"]
      ],
      assigns
    )
  end

  defp cva_class(:mode_icon, assigns) do
    cva(
      [
        variants: [
          size: [
            # 1.5rem
            default: "w-6 h-6",
            # 1rem
            small: "w-4 h-4"
          ]
        ],
        default_variants: [size: "default"]
      ],
      assigns
    )
  end

  defp color_class("bus"), do: "bg-brand-bus text-black"
  defp color_class("mattapan-line"), do: "bg-red-line text-white"
  defp color_class("green-line" <> _), do: "bg-green-line text-white"
  defp color_class(other), do: "bg-#{other} text-white"

  defp green_branches(lines) do
    lines
    |> Enum.reject(&(&1 == "green-line"))
    |> Enum.map(&String.replace(&1, "green-line-", ""))
    |> Enum.sort()
  end

  defp icon_size("small"), do: "1.25rem"
  defp icon_size(_), do: "1.5rem"

  defp label("bus"), do: gettext("bus")
  defp label("subway"), do: gettext("subway")
  defp label("commuter-rail"), do: gettext("commuter rail")
  defp label("ferry"), do: gettext("ferry")
  defp label("the-ride"), do: gettext("the ride")
  defp label("silver-line"), do: gettext("Silver Line")
  defp label("red-line"), do: gettext("Red Line")
  defp label("mattapan-line"), do: gettext("Mattapan Trolley")
  defp label("green-line"), do: gettext("Green Line")
  defp label("green-line-b"), do: gettext("Green Line B Branch")
  defp label("green-line-c"), do: gettext("Green Line C Branch")
  defp label("green-line-d"), do: gettext("Green Line D Branch")
  defp label("green-line-e"), do: gettext("Green Line E Branch")
  defp label("orange-line"), do: gettext("Orange Line")
  defp label("blue-line"), do: gettext("Blue Line")
  defp label(other), do: Gettext.gettext(MbtaMetro.Gettext, other)

  defp line_initials("green-line-" <> _), do: "GL"
  defp line_initials("mattapan-line"), do: "RL"

  defp line_initials(line) do
    line
    |> String.split("-")
    |> Enum.map(&String.first/1)
    |> Enum.join()
    |> String.upcase()
  end

  defp modifier("green-line-" <> branch), do: branch
  defp modifier("mattapan-line"), do: "m"

  defp spacing_class("small"), do: "-space-x-0.5"
  defp spacing_class(_), do: "-space-x-2"
end
