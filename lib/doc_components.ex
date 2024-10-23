defmodule MbtaMetro.DocComponents do
  @moduledoc false

  use Phoenix.Component

  attr :class, :string, default: ""
  slot :inner_block, required: true

  def code(assigns) do
    ~H"""
    <code class={"text-amber-700 py-05 px-1 text-sm #{@class}"}>
      <%= render_slot(@inner_block) %>
    </code>
    """
  end
end
