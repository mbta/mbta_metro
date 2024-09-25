defmodule MbtaMetro.Components.Flash do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.{Feedback, JS}

  alias Phoenix.LiveView.JS

  attr :id, :string, doc: "the optional id of flash container"

  attr :flash, :map, default: %{}, doc: "the map of flash messages to display"

  attr :kind, :atom,
    values: [:info, :error, :success, :warning],
    doc: "used for styling and flash lookup"

  attr :position, :string, default: "fixed top-2 right-2", doc: "CSS classes for positioning"
  attr :title, :string, default: nil
  attr :rest, :global, doc: "the arbitrary HTML attributes to add to the flash container"

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
      class={[
        @position,
        "mr-2 w-80 sm:w-96 z-50 rounded-lg p-3 ring-1",
        @kind == :error && "bg-red-100 text-red-600 shadow-md ring-red-500 fill-red-900",
        @kind == :info && "bg-blue-100 text-blue-600 ring-blue-500 fill-blue-900",
        @kind == :success && "bg-green-100 text-green-600 ring-green-500 fill-green-900",
        @kind == :warning && "bg-yellow-100 text-yellow-600 ring-yellow-500 fill-yellow-900"
      ]}
      {@rest}
    >
      <.feedback :if={@title} kind={@kind}>
        <%= @title %>
      </.feedback>
      <hr class={[
        "mt-2 mb-1",
        @kind == :error && "border-red-200",
        @kind == :info && "border-blue-200",
        @kind == :success && "border-green-200",
        @kind == :warning && "border-yellow-200"
      ]} />
      <p class="mt-2 text-sm leading-5"><%= msg %></p>
      <button type="button" class="group absolute top-1 right-1 p-2" aria-label="close">
        <Heroicons.x_mark solid class="h-5 w-5 opacity-50 group-hover:opacity-80" />
      </button>
    </div>
    """
  end
end
