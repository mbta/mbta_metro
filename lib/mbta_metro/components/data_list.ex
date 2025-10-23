defmodule MbtaMetro.Components.DataList do
  @moduledoc false

  use Phoenix.Component

  @doc """
  Renders a data list.

  ## Examples

      <.data_list>
        <:item title="Title"><%= @post.title %></:item>
        <:item title="Views"><%= @post.views %></:item>
      </.data_list>
  """
  slot :item, required: true do
    attr :title, :string, required: true
  end

  def data_list(assigns) do
    ~H"""
    <dl class="mbta-data-list">
      <div :for={item <- @item}>
        <dt>{item.title}</dt>
        <dd>{render_slot(item)}</dd>
      </div>
    </dl>
    """
  end
end
