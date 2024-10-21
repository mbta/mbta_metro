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
      <.badge :for={{[color, text], index} <- Enum.with_index(@badges)} color={color} type="circle" class={"ring-#{@background} ring-2 #{zindex(index)} px-0.5 #{@class}"}>
        <%= text %>
      </.badge>
    </div>
    """
  end

  defp square_stack(assigns) do
    ~H"""
    <div class="flex -space-x-0.5 h-7 overflow-hidden">
      <%= for {[color, text], index} <- Enum.with_index(@badges) do %>
        <.badge color={color} type="square" class={"h-7 pl-2 pr-2 first:pr-3 last:pl-3 rounded-none first:rounded-l-md last:rounded-r-md #{zindex(index)} #{@class}"}>
          <%= text %>
        </.badge>
        <%= if index < Kernel.length(@badges) - 1 do %>
          <div class={"inline-flex bg-#{@background} -mt-0.5 h-8 w-1 #{zindex(index)} transform rotate-[17deg]"}></div>
        <% end %>
      <% end %>
    </div>
    """
  end

  defp zindex(index) do
    "z-#{50 - (index * 10)}"
  end
end
