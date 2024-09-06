defmodule Blocks.Components.Button do
  @moduledoc false

  use Phoenix.Component

  attr :rest, :global, include: ~w(disabled form name value)
  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button
      class="py-3 px-4 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 focus:outline-none focus:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none"
      {@rest}>
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
