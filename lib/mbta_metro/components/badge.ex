defmodule MbtaMetro.Components.Badge do
  @moduledoc false

  use Phoenix.Component

  attr :class, :string, default: ""
  attr :color_class, :string, default: "bg-blue-500"
  attr :font_class, :string, default: "text-sm font-semibold"
  attr :padding_class, :string
  attr :rounded_class, :string, default: ""
  attr :sizing_class, :string
  attr :type, :string, required: true, values: ["circle", "square"]

  slot :inner_block, required: true

  def badge(%{type: "circle"} = assigns) do
    circle(assigns)
  end

  def badge(%{type: "square"} = assigns) do
    square(assigns)
  end

  defp circle(assigns) do
    assigns =
      assigns
      |> assign_new(:padding_class, fn -> "px-0.5 py-1" end)
      |> assign_new(:sizing_class, fn -> "w-6 h-6" end)

    ~H"""
    <div class={[
      "inline-flex rounded-full items-center justify-center whitespace-nowrap",
      @color_class,
      @font_class,
      @padding_class,
      @sizing_class,
      @class
    ]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  defp square(assigns) do
    assigns =
      assigns
      |> assign_new(:padding_class, fn -> "px-1" end)
      |> assign_new(:sizing_class, fn -> "" end)

    ~H"""
    <div class={[
      "inline-flex align-center justify-center  whitespace-nowrap",
      @color_class,
      @font_class,
      @padding_class,
      @rounded_class,
      @sizing_class,
      @class
    ]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
