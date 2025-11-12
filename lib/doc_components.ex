defmodule MbtaMetro.DocComponents do
  @moduledoc false

  use Phoenix.Component

  attr :class, :string, default: ""
  slot :inner_block, required: true

  def code(assigns) do
    ~H"""
    <code class={"text-cobalt-20 bg-cobalt-90 py-05 text-sm #{@class}"}>
      {render_slot(@inner_block)}
    </code>
    """
  end
end
