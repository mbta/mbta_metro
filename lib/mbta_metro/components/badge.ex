defmodule MbtaMetro.Components.Badge do
  @moduledoc false

  use Phoenix.Component

  attr :class, :string, default: ""
  attr :color, :string, default: "blue"
  attr :type, :string, required: true

  slot :inner_block, required: true

  def badge(%{type: "circle"} = assigns) do
    circle(assigns)
  end

  def badge(%{type: "square"} = assigns) do
    square(assigns)
  end

  defp circle(assigns) do
    ~H"""
    <div class={"inline-flex rounded-full bg-#{@color}-500 px-0.5 py-1 w-6 h-6 text-sm font-semibold text-center #{@class}"}>
      <div class="w-5 flex items-center justify-center margin-auto">
        <p><%= render_slot(@inner_block) %></p>
      </div>
    </div>
    """
  end

  defp square(assigns) do
    ~H"""
    <div class={"inline-flex bg-#{@color}-500 h-5 px-1 text-sm font-semibold #{@class}"}>
      <div class="flex items-center justify-center">
        <p><%= render_slot(@inner_block) %></p>
      </div>
    </div>
    """
  end
end
