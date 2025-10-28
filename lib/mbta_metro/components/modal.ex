defmodule MbtaMetro.Components.Modal do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Button

  alias Phoenix.LiveView.JS

  attr :modal_id, :string, required: true, doc: "ID of the associated modal. Must be unique"
  slot :inner_block, required: true

  def modal_trigger(assigns) do
    assigns =
      assign_new(assigns, :script, fn %{modal_id: id} ->
        "document.getElementById(\"#{id}\").showModal();"
      end)

    ~H"""
    <.button onclick={@script} phx-update="ignore">{render_slot(@inner_block)}</.button>
    """
  end

  attr :id, :string, required: true
  attr :show, :boolean, default: false
  attr :on_cancel, JS, default: %JS{}
  slot :inner_block, required: true
  attr :rest, :global

  @doc """
  Renders a modal.

  ## Examples

      <.modal id="confirm-modal">
        This is a modal.
      </.modal>

  JS commands may be passed to the `:on_cancel` to configure
  the closing/cancel event, for example:

      <.modal id="confirm" on_cancel={JS.navigate(~p"/posts")}>
        This is another modal.
      </.modal>

  """
  def modal(assigns) do
    ~H"""
    <dialog
      id={@id}
      class="mbta-modal"
      data-cancel={JS.exec(@on_cancel, "phx-remove")}
      {@rest}
    >
      <.focus_wrap
        id={"#{@id}-wrapper"}
        phx-window-keydown={JS.exec("data-cancel", to: "##{@id}")}
        phx-key="escape"
        phx-click-away={JS.exec("data-cancel", to: "##{@id}")}
      >
        <form method="dialog">
          <.button autofocus phx-click={JS.exec(@on_cancel, "phx-remove")} size="small">
            Close
          </.button>
        </form>
        {render_slot(@inner_block)}
      </.focus_wrap>
    </dialog>
    """
  end
end
