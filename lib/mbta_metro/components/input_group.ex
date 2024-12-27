defmodule MbtaMetro.Components.InputGroup do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Input, only: [input: 1]
  import Phoenix.HTML.Form, only: [input_id: 2, input_name: 2, input_value: 2]

  attr :options, :list
  attr :type, :string, values: ~W(checkbox checkbox-button radio radio-button)
  attr :name, :string
  attr :field, :atom
  attr :form, Phoenix.HTML.Form
  attr :class, :string, default: ""
  attr :rest, :global

  def input_group(assigns) when assigns.type in ~W(checkbox-button radio-button) do
    ~H"""
    <ul class={"inline-flex p-0 list-none rounded border border-solid border-cobalt-30 text-cobalt-30 divide-x divide-solid divide-cobalt-30 overflow-hidden #{@class}"}>
      <li
        :for={{label, value} <- @options}
        class={[
          "flex-auto",
          "has-[:checked]:bg-cobalt-80 has-[:checked]:font-bold"
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
    """
  end

  def input_group(assigns) do
    ~H"""
    <ul class={"p-0 list-none #{@class}"}>
      <li :for={{label, value} <- @options} style="height: var(--minimum-tap-target-size)">
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
    """
  end

  @doc """
  Renders a simple fieldset for grouping radio and checkbox inputs.
  """
  attr :id, :string
  attr :class, :string, default: ""
  attr :legend, :string, required: true, doc: "A concise label for the fieldset."

  slot :inner_block,
    required: true,
    doc: "The fieldset content, containing multiple options for a radio input or checkbox input."

  def fieldset(assigns) do
    ~H"""
    <fieldset class={"w-full #{@class}"}>
      <legend class="font-bold m-0 py-sm inline-flex items-center"><%= @legend %></legend>
      <%= render_slot(@inner_block) %>
    </fieldset>
    """
  end
end
