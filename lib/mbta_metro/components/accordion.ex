defmodule MbtaMetro.Components.Accordion do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Icon, only: [icon: 1]

  attr :variant, :string,
    default: "default",
    values: ["contained", "default"],
    doc: """
    The variant of the accordion. Options are `contained` or `default`.
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
  def accordion(%{variant: "contained"} = assigns) do
    ~H"""
    <details class="group w-full bg-white" open={@open}>
      <summary class="border border-solid border-cobalt-50 text-cobalt-40 hover:text-charcoal-10 hover:bg-cobalt-90 p-2 flex cursor-pointer list-none items-center gap-2 relative">
        <%= render_slot(@heading) %>
        <.icon
          name="chevron-up"
          class="group-open:rotate-180 w-4 h-4 absolute top-3 right-3 fill-cobalt-50"
        />
      </summary>
      <div class="border border-solid border-t-0 border-cobalt-50 p-2">
        <%= render_slot(@content) %>
      </div>
    </details>
    """
  end

  def accordion(assigns) do
    ~H"""
    <details class="group w-full bg-white" open={@open}>
      <summary class="text-charcoal-50 flex cursor-pointer list-none gap-2 relative py-2">
        <%= render_slot(@heading) %>
        <.icon
          name="chevron-up"
          class="group-open:rotate-180 w-4 h-4 absolute top-3 right-3 fill-cobalt-50"
        />
      </summary>
      <div class="border-t border-solid border-charcoal-70">
        <%= render_slot(@content) %>
      </div>
    </details>
    """
  end
end
