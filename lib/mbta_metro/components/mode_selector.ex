defmodule MbtaMetro.Components.ModeSelector do
  use Phoenix.Component

  attr :field, Phoenix.HTML.FormField,
    doc: "A form field struct retrieved from the form, for example: @form[:modes_to_show]"

  attr :modes, :list,
    default: [
      {"Subway", :subway},
      {"Commuter Rail", :commuter_rail},
      {"Bus", :bus},
      {"Ferry", :ferry}
    ],
    doc: """
    A list of label-value tuples.
    """

  @doc """
  Select one or more modes of transit in a very visual way.
  """
  def mode_selector(assigns) do
    assigns =
      assigns
      |> assign(field: nil, id: assigns.field.id)
      |> assign_new(:name, fn -> assigns.field.name <> "[]" end)
      |> assign_new(:value, fn -> assigns.field.value end)

    ~H"""
    <div class="flex flex-col gap-1">
      <input type="hidden" name={@name} value="" checked={@value == []} />
      <label
        :for={{mode_name, mode_value} <- @modes}
        for={@id <> "_#{mode_value}"}
        class="rounded border-solid border-2 border-transparent has-[:checked]:bg-slate-100 has-[:checked]:font-semibold has-[:focus-within]:border-slate-400
      py-1 px-2 mb-0 inline-flex items-center gap-2"
      >
        <div class="relative">
          <input
            id={@id <> "_#{mode_value}"}
            type="checkbox"
            class="peer sr-only"
            name={@name}
            value={mode_value}
            checked={if(@value, do: mode_value in @value || "#{mode_value}" in @value)}
          />
          <div class="h-8 overflow-hidden rounded-full border-2 border-solid border-slate-200 bg-slate-100 w-14 peer-checked:border-slate-400 peer-checked:bg-slate-300">
          </div>
          <div class="absolute w-6 h-6 rounded-full shadow-lg shadow-indigo-500/40 left-1 top-1 transition opacity-50 peer-checked:translate-x-full peer-checked:opacity-100">
            <%= mode_icon(mode_value) %>
          </div>
        </div>
        <%= mode_name %>
      </label>
    </div>
    """
  end

  defp mode_icon(:commuter_rail),
    do: get_mode_icon("icon-mode-commuter-rail.svg")

  defp mode_icon(:subway),
    do: get_mode_icon("icon-mode-subway.svg")

  defp mode_icon(:bus),
    do: get_mode_icon("icon-mode-bus.svg")

  defp mode_icon(:ferry),
    do: get_mode_icon("icon-mode-ferry.svg")

  defp get_mode_icon(path) do
    :mbta_metro
    |> Application.app_dir("priv/static/images")
    |> Path.join(path)
    |> File.read!()
    |> Phoenix.HTML.raw()
  end
end
