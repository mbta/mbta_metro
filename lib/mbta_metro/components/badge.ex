defmodule MbtaMetro.Components.Badge do
  @moduledoc false

  use Phoenix.Component

  attr :class, :string, default: ""
  attr :color, :string, default: "blue-200"
  attr :variant, :string, default: "square", values: ["circle", "pill", "square"]

  slot :inner_block, required: true

  def badge(%{variant: "circle"} = assigns) do
    assigns
    |> assign(:variant_class, "px-0.5 py-1 w-6 h-6 rounded-full font-semibold")
    |> base_badge()
  end

  def badge(%{variant: "pill"} = assigns) do
    assigns
    |> assign(:variant_class, "px-2 py-1 rounded-full font-semibold")
    |> base_badge()
  end

  def badge(%{variant: "square"} = assigns) do
    assigns
    |> assign(:variant_class, "px-2 py-1 rounded-md min-w-8 font-bold")
    |> base_badge()
  end

  defp base_badge(assigns) do
    ~H"""
    <div class={[
      "inline-flex items-center justify-center whitespace-nowrap leading-none text-sm",
      "bg-#{@color}",
      @variant_class,
      @class
    ]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
