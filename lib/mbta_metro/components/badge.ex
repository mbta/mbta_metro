defmodule MbtaMetro.Components.Badge do
  @moduledoc false

  use Phoenix.Component

  attr :class, :string, default: ""
  attr :color, :string, required: true
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
    <div class={"inline-flex rounded-full bg-#{@color}-500 px-1 py-1 w-7 h-7 text-lg font-semibold text-center #{@class}"}>
      <div class="w-8 flex items-center justify-center margin-auto">
        <p><%= render_slot(@inner_block) %></p>
      </div>
    </div>
    """
  end

  defp square(assigns) do
    ~H"""
    <div class={"inline-flex rounded-md bg-#{@color}-500 h-7 px-1 text-md font-semibold #{@class}"}>
      <div class="flex items-center justify-center">
        <p><%= render_slot(@inner_block) %></p>
      </div>
    </div>
    """
  end
end
