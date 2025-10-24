defmodule MbtaMetro.Components.Flash do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Feedback, only: [feedback: 1]
  import MbtaMetro.Components.Icon, only: [icon: 1]
  import MbtaMetro.Components.JS, only: [hide: 2]

  alias Phoenix.LiveView.JS

  attr :id, :string, doc: "the optional id of flash component"

  attr :flash, :map, default: %{}, doc: "the map of flash messages to display"

  attr :kind, :atom,
    values: [:info, :error, :success, :warning],
    doc: "used for styling and flash lookup"

  attr :position, :string, default: "", doc: "CSS classes for positioning"
  attr :title, :string, default: nil
  attr :rest, :global, doc: "the arbitrary HTML attributes to add to the flash component"

  slot :inner_block, doc: "the optional inner block that renders the flash message"

  @doc """
  Renders flash notices.

  ## Examples

      <.flash kind={:info} flash={@flash} />
      <.flash kind={:info} phx-mounted={show("#flash")}>Welcome Back!</.flash>
  """
  def flash(assigns) do
    assigns = assign_new(assigns, :id, fn -> "flash-#{assigns.kind}" end)

    ~H"""
    <div
      :if={msg = render_slot(@inner_block) || Phoenix.Flash.get(@flash, @kind)}
      id={@id}
      phx-click={JS.push("lv:clear-flash", value: %{key: @kind}) |> hide("##{@id}")}
      role="alert"
      class={["mbta-flash mbta-flash--#{@kind}", @position]}
      {@rest}
    >
      <.feedback :if={@title} kind={@kind}>
        {@title}
      </.feedback>
      <hr />
      <p>{msg}</p>
      <button type="button" class="mbta-close" aria-label="close">
        <.icon name="xmark" />
      </button>
    </div>
    """
  end
end
