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
    <div class="mt-14">
      <dl class="-my-4 divide-y divide-charcoal-90">
        <div :for={item <- @item} class="flex gap-4 py-4 text-sm leading-6 sm:gap-8">
          <dt class="w-1/4 flex-none text-charcoal-50">{item.title}</dt>
          <dd class="text-charcoal-30">{render_slot(item)}</dd>
        </div>
      </dl>
    </div>
    """
  end
end
