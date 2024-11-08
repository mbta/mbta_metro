defmodule MbtaMetro.Components.BadgeStack do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Badge, only: [badge: 1]

  attr :background, :string, default: "white"
  attr :class, :string, default: ""
  attr :badges, :list, required: true
  attr :type, :string, required: true

  def badge_stack(%{type: "circle"} = assigns) do
    circle_stack(assigns)
  end

  def badge_stack(%{type: "square"} = assigns) do
    square_stack(assigns)
  end

  defp circle_stack(assigns) do
    ~H"""
    <div class="flex -space-x-0.5">
      <.badge
        :for={{[color, text], index} <- Enum.with_index(@badges)}
        color_class={color}
        type="circle"
        class={"ring-#{@background} ring-2 #{zindex(index)} #{@class}"}
      >
        <%= text %>
      </.badge>
    </div>
    """
  end

  defp square_stack(assigns) do
    ~H"""
    <div class="flex -space-x-0.5 h-5 overflow-hidden">
      <%= for {[color, text], index} <- Enum.with_index(@badges) do %>
        <.badge
          color_class={color}
          padding_class="px-2 first:px-2.5"
          rounded_class="first:rounded-l-sm last:rounded-r-sm"
          type="square"
          class={"#{zindex(index)} #{@class}"}
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
