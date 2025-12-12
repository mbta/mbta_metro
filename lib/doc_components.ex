defmodule MbtaMetro.DocComponents do
  @moduledoc false

  use Phoenix.Component

  attr :class, :string, default: ""
  slot :inner_block, required: true

  def code(assigns) do
    ~H"""
    <code class={"border border-cobalt-70 text-cobalt-20 bg-cobalt-90 inline-block px-xs py-05 rounded #{@class}"}>
      {render_slot(@inner_block)}
    </code>
    """
  end
end
