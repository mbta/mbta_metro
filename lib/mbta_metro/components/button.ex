defmodule MbtaMetro.Components.Button do
  @moduledoc false

  use Phoenix.Component

  attr :color, :string, default: "blue"
  attr :rest, :global, include: ~w(disabled form name value)
  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button
      class={"py-3 px-4 inline-flex items-center gap-x-2 text-sm capitalize font-medium rounded border border-transparent bg-#{assigns[:color]}-500 text-white hover:bg-#{assigns[:color]}-700 focus:outline-none focus:bg-#{assigns[:color]}-600 disabled:opacity-50 disabled:pointer-events-none phx-submit-loading:opacity-75"}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
