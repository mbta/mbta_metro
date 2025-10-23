defmodule MbtaMetro.Components.List do
  @moduledoc false

  use Phoenix.Component

  @doc """
  Renders a list of items.

  ## Examples

      <.list>
        <:item>Foo</:item>
        <:item>Bar</:item>
        <:item>Baz</:item>
      </.list>
  """
  attr :class, :string, default: ""

  slot :item, required: true do
    attr :class, :string
  end

  def list(assigns) do
    ~H"""
    <ul class={"mbta-list #{@class}"}>
      <li
        :for={item <- @item}
        class={Map.get(item, :class, "")}
      >
        {render_slot(item)}
      </li>
    </ul>
    """
  end
end
