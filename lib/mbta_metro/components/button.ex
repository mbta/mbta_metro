defmodule MbtaMetro.Components.Button do
  @moduledoc false

  use Phoenix.Component

  attr :class, :string, default: ""
  attr :rest, :global, include: ~w(disabled form name value)

  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button
      class={"py-1 px-3 inline-flex items-center gap-x-2 capitalize font-medium rounded border border-transparent bg-cobalt-40 text-white hover:bg-cobalt-30 focus:outline-none focus:bg-cobalt-30 disabled:opacity-50 disabled:pointer-events-none phx-submit-loading:opacity-75 #{@class}"}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
