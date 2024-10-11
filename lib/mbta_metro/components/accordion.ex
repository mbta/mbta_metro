defmodule MbtaMetro.Components.Accordion do
  use Phoenix.Component

  attr :id, :string,
    required: true,
    doc: """
    A unique identifier for the accordion.
    """

  attr :open, :boolean,
    default: false,
    doc: """
    Whether the accordion starts open or closed.
    """

  slot :content, required: true

  slot :extra,
    required: false,
    doc: """
    Supplemental content to be shown below the accordion. Helpful for showing error states if form inputs are inside the component.
    """

  slot :heading,
    required: true,
    doc: """
    The header of the component. Supports HTML markup.
    """

  @doc """
  A disclosure widget that reveals or hides additional content.
  """
  def accordion(assigns) do
    ~H"""
    <details id={@id} class="group w-full bg-white" open={@open}>
      <summary class="border border-solid border-blue-500 text-blue-600 hover:text-slate-900 hover:bg-blue-100 p-2 flex cursor-pointer list-none items-center gap-2 p-2 relative">
        <%= render_slot(@heading) %>
        <Heroicons.chevron_down class="group-open:rotate-180 w-4 h-4 absolute top-3 right-3" />
      </summary>
      <div class="border border-solid border-t-0 border-blue-500 p-2">
        <%= render_slot(@content) %>
      </div>
    </details>
    <%= render_slot(@extra) %>
    """
  end
end
