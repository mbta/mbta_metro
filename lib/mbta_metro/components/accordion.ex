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
    <details class="group w-full bg-white" open={@open}>
      <summary class="rounded border border-cobalt-30 hover:bg-cobalt-80 px-md py-sm flex cursor-pointer list-none items-center gap-2 relative group-open:rounded-none group-open:rounded-t group-open:border-b-0 focus:ring-4 focus:border-cobalt-20 ring-offset-0 ring-cobalt-60 group-open:bg-cobalt-80">
        <%= render_slot(@heading) %>
        <.icon name="chevron-down" class="group-open:rotate-180 w-4 h-4 absolute top-3 right-md" />
      </summary>
      <div class="border border-cobalt-30 px-md py-sm">
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
