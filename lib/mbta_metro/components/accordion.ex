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
      <summary class="border border-solid border-blue-500 text-blue-600 hover:text-slate-900 hover:bg-blue-100 p-2 flex cursor-pointer list-none items-center gap-2 relative">
        <%= render_slot(@heading) %>
        <.icon
          name="chevron-up"
          class="group-open:rotate-180 w-4 h-4 absolute top-3 right-3 fill-blue-500"
        />
      </summary>
      <div class="border border-solid border-t-0 border-blue-500 p-2">
        <%= render_slot(@content) %>
      </div>
    </details>
    """
  end

  def accordion(assigns) do
    ~H"""
    <details class="group w-full bg-white" open={@open}>
      <summary class="text-slate-500 flex cursor-pointer list-none gap-2 relative py-2">
        <%= render_slot(@heading) %>
        <.icon
          name="chevron-up"
          class="group-open:rotate-180 w-4 h-4 absolute top-3 right-3 fill-blue-500"
        />
      </summary>
      <div class="border-t border-solid border-slate-300">
        <%= render_slot(@content) %>
      </div>
    </details>
    """
  end
end
