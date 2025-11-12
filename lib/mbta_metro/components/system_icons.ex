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

  # note: these are in GTFS route_sort_order
  @supported_lines [
    "red-line",
    "mattapan-line",
    "orange-line",
    "green-line",
    "green-line-b",
    "green-line-c",
    "green-line-d",
    "green-line-e",
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
          class={["mbta-system-icon", @class]}
        />
        """
      else
        ~H"""
        <span
          class="mbta-icon-stacked"
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
            do: "mbta-route-silver-line",
            else: "mbta-route-bus"
          ),
          cva_class(:route_icon, assigns)
        ]
        |> Enum.join(" ")
      )

    ~H"""
    <.route_pill class={@class}>{@name}</.route_pill>
    """
  end

  def route_icon(assigns), do: ~H"<span />"

  @doc """
  A special case for depicting route icons together. A generic list is preferred, as it is more flexible.
  """
  attr :class, :string, default: ""
  attr :lines, :list, required: false, doc: "Valid values include #{inspect(@supported_lines)}"
  attr :names, :list

  # Single route pill
  def stacked_route_icon(%{lines: [line]} = assigns) when line in @supported_lines do
    assigns = assign(assigns, :line, line)

    ~H"""
    <.route_icon {assigns} />
    """
  end

  # Green Line pill with one or more modifier icons
  # Mattapan route pill
  # or multiple pills
  def stacked_route_icon(%{lines: [_ | _]} = assigns) do
    assigns = assign(assigns, :stacks, line_stacks(assigns.lines))

    if length(assigns.stacks) > 1 do
      ~H"""
      <span class="mbta-icon-stacked">
        <.stacked_route_icon
          :for={stack_lines <- @stacks}
          lines={stack_lines}
        />
      </span>
      """
    else
      cond do
        Enum.all?(assigns.lines, &String.starts_with?(&1, "green-line")) ->
          assigns = assign(assigns, :branches, green_branches(assigns.lines))

          ~H"""
          <span
            class="mbta-icon-stacked"
            aria-label={combined_gl_label(@lines)}
          >
            <.route_icon line="green-line" class={@class} />
            <.icon
              :for={{branch, index} <- Enum.with_index(@branches)}
              type="system"
              aria-hidden="true"
              name={"modifier-#{branch}-default"}
              height={icon_size("default")}
            />
          </span>
          """

        "mattapan-line" in assigns.lines ->
          assigns = assign(assigns, :lines, ["mattapan-line"])

          ~H"""
          <.stacked_route_icon {assigns} />
          """

        true ->
          ~H"""
          <span class="mbta-icon-stacked">
            <.route_icon
              :for={line <- sort_lines(@lines)}
              line={line}
              class={@class}
            />
          </span>
          """
      end
    end
  end

  def stacked_route_icon(%{names: [name]} = assigns) do
    assigns = assign(assigns, :name, name)

    ~H"""
    <.route_icon name={@name} class={@class} />
    """
  end

  def stacked_route_icon(%{names: _} = assigns) do
    ~H"""
    <span class="mbta-icon-stacked--slashed">
      <%= for {name, index} <- Enum.with_index(@names) do %>
        <.route_icon name={name} class={@class} />
        <span
          :if={index < Kernel.length(@names) - 1}
          class="mbta-slash"
          aria-label="or"
        />
      <% end %>
    </span>
    """
  end

  def stacked_route_icon(assigns), do: ~H"<span />"

  @valid_modes ["subway", "bus", "commuter-rail", "ferry", "the-ride"]

  attr :class, :string, default: ""
  attr :mode, :string, required: true, values: @valid_modes
  attr :size, :string, default: "default", values: ["default", "small"]

  @doc """
  A round icon depicting a mode of transit. Supported modes: #{inspect(@valid_modes)}

  <iframe style="border: 1px solid rgba(0, 0, 0, 0.1);" width="800" height="350" src="https://embed.figma.com/design/IupfoRXJNItGDD8ZaZCxDz/branch/lMS9vgBPCx0HLbDqONQlha/MBTA-Rider-Design-System-Components?m=auto&node-id=2483-821&embed-host=share" allowfullscreen></iframe>
  """
  def mode_icon(%{line: _} = assigns) do
    line_class = color_class(assigns.line)
    class = cva_class(:mode_icon, assigns)
    assigns = assign(assigns, :class, "#{class} #{line_class}")

    ~H"""
    <.icon type="system" class={@class} name={"mode-#{@mode}-#{@size}"} aria-label={label(@mode)} />
    """
  end

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
      class={"mbta-system-route-pill #{@class}"}
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
            default: "mbta-system-route-icon",
            # minimum 28px wide
            small: "mbta-system-route-icon--small"
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
            default: "mbta-system-mode-icon",
            # 1rem
            small: "mbta-system-mode-icon--small"
          ]
        ],
        default_variants: [size: "default"]
      ],
      assigns
    )
  end

  defp color_class("mattapan-line"), do: "mbta-route-red-line"
  defp color_class("green-line" <> _), do: "mbta-route-green-line"
  defp color_class(other), do: "mbta-route-#{other}"

  defp combined_gl_label([line]), do: label(line)

  defp combined_gl_label(lines) do
    branches = green_branches(lines)
    "Green Line #{Enum.join(branches, ", ")} Branches"
  end

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
  defp label("the-ride"), do: "The Ride"
  defp label("silver-line"), do: "Silver Line"
  defp label("red-line"), do: "Red Line"
  defp label("mattapan-line"), do: "Mattapan Trolley"
  defp label("green-line"), do: "Green Line"
  defp label("green-line-b"), do: "Green Line B Branch"
  defp label("green-line-c"), do: "Green Line C Branch"
  defp label("green-line-d"), do: "Green Line D Branch"
  defp label("green-line-e"), do: "Green Line E Branch"
  defp label("orange-line"), do: "Orange Line"
  defp label("blue-line"), do: "Blue Line"
  defp label(other), do: other

  defp line_initials("green-line-" <> _), do: "GL"
  defp line_initials("mattapan-line"), do: "RL"

  defp line_initials(line) do
    line
    |> String.split("-")
    |> Enum.map(&String.first/1)
    |> Enum.join()
    |> String.upcase()
  end

  defp line_stacks(lines) do
    lines
    |> Enum.group_by(fn line ->
      cond do
        String.starts_with?(line, "green-line") -> :green_stack
        line in ["mattapan-line", "red-line"] -> :red_stack
        true -> :unstacked
      end
    end)
    |> Enum.sort_by(& &1, :desc)
    |> Keyword.values()
  end

  defp modifier("green-line-" <> branch), do: branch
  defp modifier("mattapan-line"), do: "m"

  # Preserve the desired sorting from `@supported_lines`
  defp sort_lines(lines) do
    lines
    |> Enum.sort_by(fn line ->
      Enum.find_index(@supported_lines, &(&1 == line))
    end)
  end
end
