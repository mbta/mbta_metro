defmodule MbtaMetro.Components.Button do
  @moduledoc false

  use Phoenix.Component

  import CVA

  @config [
    variants: [
      variant: [
        primary: "mbta-metro-button--primary",
        secondary: "mbta-metro-button--secondary",
        tertiary: "mbta-metro-button--tertiary"
      ],
      size: [
        default: "mbta-metro-button",
        small: "mbta-metro-button mbta-metro-button--small"
      ]
    ],
    default_variants: [
      variant: :primary,
      size: :default
    ]
  ]

  attr :class, :string, default: ""
  attr :variant, :string, values: ~w(primary secondary tertiary), default: "primary"
  attr :size, :string, values: ~w(default small), default: "default"
  attr :text, :string, required: true
  attr :rest, :global

  slot :icon, doc: "Optional icon to precede the button text"

  @doc """
  Indicate a user can take an action or series of actions from a list of options.
  """
  def button(%{variant: variant, size: size} = assigns) do
    assigns =
      assign(
        assigns,
        :class,
        cva("flex #{assigns.class}", @config, variant: variant, size: size)
      )

    ~H"""
    <button class={@class} {@rest}>
      <span class="shrink-0" :if={@icon != []}>
        {render_slot(@icon)}
      </span>
      {@text}
    </button>
    """
  end
end
