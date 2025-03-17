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
    <ul class={"flex flex-col w-full divide-y divide-charcoal-80 ps-0 #{@class}"}>
      <li
        :for={item <- @item}
        class={"inline-flex items-center gap-x-2 py-2 #{Map.get(item, :class, "")}"}
      >
        {render_slot(item)}
      </li>
    </ul>
    """
  end
end
