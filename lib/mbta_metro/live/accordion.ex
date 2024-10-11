defmodule MbtaMetro.Live.Accordion do
  @moduledoc """
  A disclosure widget that reveals or hides additional content.

  The following named slots are required, both supporting arbitrary HTML markup.

    * `:heading` - The header of the component. Clicking on this reveals content
    * `:content` - The content inside the accordion.

  You can optionally pass the following:

    * `:extra` - Supplemental content to be shown below the accordion. Helpful
      for showing error states if form inputs are inside the component. Defaults
      to empty
    * `:open` - Whether the accordion initializes as open or closed. Defaults to
      closed.
  """

  use Phoenix.LiveComponent

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    assigns = assigns
      |> assign_new(:extra, fn -> [] end)
      |> assign_new(:open, fn -> false end)

    ~H"""
    <div class="w-full">
      <details class="group bg-white" open={@open} phx-click="toggle_open">
        <summary class="border border-solid border-blue-500 text-blue-600 hover:text-slate-900 hover:bg-blue-100 flex cursor-pointer list-none items-center gap-2 p-2 relative">
          <span class="grow"><%= render_slot(@heading) %></span>
          <Heroicons.chevron_down class="flex-none group-open:rotate-180 w-4 h-4 ml-2" />
        </summary>
        <div class="border border-solid border-t-0 border-blue-500 p-2">
          <%= render_slot(@content) %>
        </div>
      </details>
      <%= render_slot(@extra) %>
    </div>
    """
  end

  def handle_event("toggle_open", _, %{assigns: %{open: open}} = socket) do
    {:noreply, assign(socket, :open, !open)}
  end
end
