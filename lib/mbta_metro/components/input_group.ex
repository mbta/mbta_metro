defmodule MbtaMetro.Components.InputGroup do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Input, only: [label: 1, input: 1]
  import Phoenix.HTML.Form, only: [input_id: 2, input_name: 2, input_value: 2]

  @doc """
  An input group receives input from a group of 2 or more radios or checkboxes. An input group can be displayed as segmented buttons using the `as_buttons` property. Input groups include a label for the group and can display an error message for the group.
  """

  slot :input, required: true do
    attr :value, :string, required: true
  end

  attr :options, :list
  attr :type, :string, values: ~W(checkbox radio)
  attr :as_buttons, :boolean, default: false
  attr :name, :string
  attr :label, :string, required: true
  attr :field, :atom
  attr :form, Phoenix.HTML.Form
  attr :class, :string, default: ""
  attr :rest, :global

  def input_group(%{as_buttons: true} = assigns) do
    ~H"""
    <fieldset class={"mbta-input-group #{@class}"}>
      <legend class="mbta-label">{@label}</legend>
      <div class="mbta-input-group--buttons">
        <.label
          :for={input <- @input}
          for={input_id(@form, @field) <> "_#{input.value}"}
          class="mbta-button mbta-button-secondary"
        >
          <input
            type={@type}
            id={input_id(@form, @field) <> "_#{input.value}"}
            type={@type}
            name={input_name(@form, @field)}
            value={input.value}
            checked={input_value(@form, @field) == input.value}
            {@rest}
          />
          {render_slot(input)}
        </.label>
      </div>
    </fieldset>
    """
  end

  def input_group(assigns) do
    ~H"""
    <fieldset class={"mbta-input-group #{@class}"}>
      <legend class="mbta-label">{@label}</legend>
      <.input
        :for={input <- @input}
        id={input_id(@form, @field) <> "_#{input.value}"}
        type={@type}
        name={input_name(@form, @field)}
        value={input.value}
        field={@form[@field]}
        checked={input_value(@form, @field) == input.value}
        {@rest}
      >
        {render_slot(input)}
      </.input>
    </fieldset>
    """
  end
end
