defmodule MbtaMetro.Components.Table do
  @moduledoc false

  use Phoenix.Component

  alias Phoenix.LiveView.LiveStream

  attr :id, :string, required: true
  attr :rows, :list, required: true
  attr :row_id, :any, default: nil, doc: "the function for generating the row id"

  attr :row_item, :any,
    default: &Function.identity/1,
    doc: "the function for mapping each row before calling the :col and :action slots"

  slot :col, required: true do
    attr :label, :string
  end

  slot :action, doc: "the slot for showing user actions in the last table column"

  @doc """
  Renders a table with generic styling.

  ## Examples

      <.table id="users" rows={@users}>
        <:col :let={user} label="id"><%= user.id %></:col>
        <:col :let={user} label="username"><%= user.username %></:col>
      </.table>
  """
  def table(assigns) do
    assigns =
      with %{rows: %LiveStream{}} <- assigns do
        assign(assigns, row_id: assigns.row_id || fn {id, _item} -> id end)
      end

    ~H"""
    <table class="mbta-table">
      <thead>
        <tr>
          <th :for={col <- @col} scope="col">{col[:label]}</th>
          <th :if={@action != []} scope="col">
            <span class="sr-only">"Actions"</span>
          </th>
        </tr>
      </thead>
      <tbody
        id={@id}
        phx-update={match?(%LiveStream{}, @rows) && "stream"}
        class="relative"
      >
        <tr :for={row <- @rows} id={@row_id && @row_id.(row)}>
          <td :for={{col, _i} <- Enum.with_index(@col)}>
            {render_slot(col, @row_item.(row))}
          </td>
          <td :if={@action != []} class="mbta-table-action">
            <%= for action <- @action do %>
              {render_slot(action, @row_item.(row))}
            <% end %>
          </td>
        </tr>
      </tbody>
    </table>
    """
  end
end
