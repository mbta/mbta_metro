defmodule MbtaMetro.Components.BadgeStack do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Badge, only: [badge: 1]

  attr :background, :string, default: "white"
  attr :class, :string, default: ""
  attr :badges, :list, required: true
  attr :variant, :string, required: true, values: ["circle", "square"]

  def badge_stack(%{variant: "circle"} = assigns) do
    circle_stack(assigns)
  end

  def badge_stack(%{variant: "square"} = assigns) do
    square_stack(assigns)
  end

  defp circle_stack(assigns) do
    ~H"""
    <div class="inline-flex -space-x-0.5">
      <.badge
        :for={{[color, text], index} <- Enum.with_index(@badges)}
        variant="circle"
        color={color}
        class={"ring-#{@background} ring-2 #{zindex(index)} #{@class}"}
      >
        <%= text %>
      </.badge>
    </div>
    """
  end

  defp square_stack(assigns) do
    ~H"""
    <div class="inline-flex -space-x-0.5 h-5 overflow-hidden">
      <%= for {[color, text], index} <- Enum.with_index(@badges) do %>
        <.badge
          color={color}
          variant="square"
          class={"px-2 first:px-2.5 [&:not(:first-child)]:rounded-l-none [&:not(:last-child)]:rounded-r-none #{zindex(index)} #{@class}"}
        >
          <%= text %>
        </.badge>
        <%= if index < Kernel.length(@badges) - 1 do %>
          <div class={"inline-flex bg-#{@background} -mt-0.5 h-6 w-1 #{zindex(index)} transform rotate-[17deg]"}>
          </div>
        <% end %>
      <% end %>
    </div>
    """
  end

  defp zindex(index) do
    "z-#{50 - index * 10}"
  end
end
