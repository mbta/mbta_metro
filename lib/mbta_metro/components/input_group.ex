defmodule MbtaMetro.Components.InputGroup do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Input, only: [input: 1]
  import Phoenix.HTML.Form, only: [input_id: 2, input_name: 2, input_value: 2]

  attr :legend, :string
  attr :options, :list
  attr :type, :string, values: ~W(checkbox checkbox-button radio radio-button)
  attr :id, :string
  attr :name, :string
  attr :field, :atom
  attr :form, Phoenix.HTML.Form
  attr :rest, :global

  def input_group(assigns) do
    ~H"""
    <.fieldset legend={@legend} id={@id}>
      <ul class="p-0 flex flex-col sm:flex-row list-none">
        <li
          :for={{label, value} <- @options}
          class={[
            "border border-solid border-blue-400 px-3 py-0 text-blue-400 cursor-pointer",
            "has-[:checked]:bg-blue-100 has-[:checked]:font-bold",
            "[&:not(:last-child)]:border-r-0",
            "sm:first:rounded-l-md sm:last:rounded-r-md",
            "sm:first:rounded-l-md sm:last:rounded-r-md",
            "max-sm:-mb-px has-[:checked]:max-sm:mb-0",
            "sm:-mr-px has-[:checked]:sm:mr-0 w-full"
          ]}
        >
          <.input
            id={input_id(@form, @field) <> "_#{value}"}
            label={label}
            type={@type}
            name={input_name(@form, @field)}
            value={value}
            field={@form[@field]}
            checked={input_value(@form, @field) == value}
            {@rest}
          />
        </li>
      </ul>
    </.fieldset>
    """
  end

  @doc """
  Renders a simple fieldset for grouping radio and checkbox inputs.
  """
  attr :id, :string
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
