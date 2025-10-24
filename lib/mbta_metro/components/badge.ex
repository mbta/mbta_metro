defmodule MbtaMetro.Components.Badge do
  @moduledoc false

  use Phoenix.Component

  attr :class, :string, default: ""
  attr :variant, :string, default: "square", values: ["circle", "pill", "square"]

  slot :inner_block, required: true

  def badge(%{variant: "circle"} = assigns) do
    assigns
    |> assign(:variant_class, "mbta-badge--circle")
    |> base_badge()
  end

  def badge(%{variant: "pill"} = assigns) do
    assigns
    |> assign(:variant_class, "mbta-badge--pill")
    |> base_badge()
  end

  def badge(%{variant: "square"} = assigns) do
    assigns
    |> assign(:variant_class, "mbta-badge--square")
    |> base_badge()
  end

  defp base_badge(assigns) do
    ~H"""
    <div class={[
      "mbta-badge",
      @variant_class,
      @class
    ]}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
