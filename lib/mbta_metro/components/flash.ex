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

  attr :position, :string, default: "fixed top-2 right-2", doc: "CSS classes for positioning"
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
      class={[
        @position,
        "mr-2 w-80 sm:w-96 z-50 rounded-lg p-3 ring-1",
        @kind == :error &&
          "bg-firebrick-90 text-firebrick-40 shadow-4 ring-firebrick-50 fill-firebrick-10",
        @kind == :info && "bg-cobalt-90 text-cobalt-40 ring-cobalt-50 fill-cobalt-10",
        @kind == :success && "bg-emerald-90 text-emerald-40 ring-emerald-50 fill-emerald-10",
        @kind == :warning && "bg-gold-90 text-gold-40 ring-gold-50 fill-gold-10"
      ]}
      {@rest}
    >
      <.feedback :if={@title} kind={@kind}>
        {@title}
      </.feedback>
      <hr class={[
        "mt-2 mb-1",
        @kind == :error && "border-firebrick-80",
        @kind == :info && "border-cobalt-80",
        @kind == :success && "border-emerald-80",
        @kind == :warning && "border-gold-80"
      ]} />
      <p class="mt-2 text-sm leading-5">{msg}</p>
      <button type="button" class="group absolute top-1 right-1 p-2" aria-label="close">
        <.icon name="xmark" class={"h-5 w-5 opacity-70 group-hover:opacity-90 #{fill(@kind)}"} />
      </button>
    </div>
    """
  end

  defp fill(:error), do: "fill-firebrick-40"
  defp fill(:info), do: "fill-cobalt-40"
  defp fill(:success), do: "fill-emerald-40"
  defp fill(:warning), do: "fill-gold-40"
end
