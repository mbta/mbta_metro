defmodule MbtaMetro.Components.Accordion do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Icon, only: [icon: 1]

  attr :variant, :string,
    default: "default",
    values: ["default", "multiselect"],
    doc: """
    The variant of the accordion. Options are `default` or `multiselect`.
    """

  attr :open, :boolean,
    default: false,
    doc: """
    Whether the accordion starts open or closed.
    """

  slot :content, required: true

  slot :heading,
    required: true,
    doc: """
    The header of the component. Supports HTML markup.
    """

  @doc """
  A disclosure widget that reveals or hides additional content.
  """
  def accordion(%{variant: "multiselect"} = assigns) do
    ~H"""
    <details class="mbta-accordion--multiselect" open={@open}>
      <summary>
        {render_slot(@heading)}
        <.icon name="chevron-down" class="mbta-accordion-arrow" />
      </summary>
      <div>
        {render_slot(@content)}
      </div>
    </details>
    """
  end

  def accordion(assigns) do
    ~H"""
    <details class="mbta-accordion" open={@open}>
      <summary>
        {render_slot(@heading)}
        <.icon
          name="chevron-up"
          class="mbta-accordion-arrow"
        />
      </summary>
      <div>
        {render_slot(@content)}
      </div>
    </details>
    """
  end
end
