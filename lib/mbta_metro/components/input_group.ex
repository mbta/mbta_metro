defmodule MbtaMetro.Components.InputGroup do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Input, only: [input: 1]

  attr :legend, :string
  attr :options, :list
  attr :type, :string, values: ~W(checkbox radio)
  attr :name, :string

  def input_group(assigns) do
    ~H"""
    <.fieldset legend={@legend}>
      <ul class="p-0 mt-2 flex flex-col sm:flex-row list-none">
        <li
          :for={{label, value} <- @options}
          class={[
            "border border-solid border-slate-300 px-3 py-0",
            "has-[:checked]:border has-[:checked]:bg-blue-50 has-[:checked]:border-blue-400 has-[:checked]:font-bold",
            "first:max-sm:rounded-t-lg last:max-sm:rounded-b-lg",
            "sm:first:rounded-l-lg sm:last:rounded-r-lg",
            "sm:first:rounded-l-lg sm:last:rounded-r-lg",
            "max-sm:-mb-px has-[:checked]:max-sm:mb-0",
            "sm:-mr-px has-[:checked]:sm:mr-0"
          ]}
        >
          <.input type={@type} name={@name} label={label} value={value} class="w-full sr-only" />
        </li>
      </ul>
    </.fieldset>
    """
  end

  @doc """
  Renders a simple fieldset for grouping radio and checkbox inputs.
  """
  attr :legend, :string, required: true, doc: "A concise label for the fieldset."

  slot :inner_block,
    required: true,
    doc: "The fieldset content, containing multiple options for a radio input or checkbox input."

  def fieldset(assigns) do
    ~H"""
    <fieldset class="my-3 w-full">
      <legend class="font-bold text-base text-slate-700"><%= @legend %></legend>
      <%= render_slot(@inner_block) %>
    </fieldset>
    """
  end
end
