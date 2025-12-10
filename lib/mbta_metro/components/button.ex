defmodule MbtaMetro.Components.Button do
  @moduledoc false

  use Phoenix.Component
  use CVA.Component

  attr :class, :string, default: ""
  attr :rest, :global, include: ["popovertarget"]

  slot :inner_block, required: true

  variant :variant,
          [
            primary: "mbta-button mbta-button-primary",
            secondary: "mbta-button mbta-button-secondary",
            tertiary: "mbta-button mbta-button-tertiary"
          ],
          default: :primary

  variant :size,
          [
            default: "",
            small: "mbta-button-small"
          ],
          default: :default

  @doc """
  Button styles in primary, secondary, and tertiary variants, and small and regular sizing.
  """
  def button(%{variant: "tertiary", size: "default"} = assigns) do
    assigns
    |> assign(:size, "small")
    |> button()
  end

  def button(assigns) do
    ~H"""
    <button class={"#{@cva_class} #{@class}"} {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end
end
