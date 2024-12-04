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

  slot :item, required: true

  def list(assigns) do
    ~H"""
    <ul class={"max-w-xs flex flex-col divide-y divide-slate-200 #{@class}"}>
      <li :for={item <- @item} class="inline-flex items-center gap-x-2 py-2">
        <%= render_slot(item) %>
      </li>
    </ul>
    """
  end
end
