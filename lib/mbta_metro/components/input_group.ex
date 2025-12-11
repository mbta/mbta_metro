defmodule MbtaMetro.Components.InputGroup do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Input, only: [label: 1, input: 1]
  import MbtaMetro.Components.Feedback
  import Phoenix.HTML.Form, only: [input_id: 2, input_name: 2, input_value: 2]

  slot :input, required: true do
    attr :value, :string, required: true
  end

  attr :options, :list
  attr :type, :string, values: ~W(checkbox radio)
  attr :variant, :string, values: ~w(buttons cards default), default: "default"
  attr :name, :string
  attr :label, :string, required: true
  attr :errors, :list, default: []
  attr :field, :atom
  attr :form, Phoenix.HTML.Form
  attr :class, :string, default: ""
  attr :rest, :global

  def input_group(%{variant: "buttons"} = assigns) do
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
      <.feedback :for={msg <- @errors} kind={:error}>{msg}</.feedback>
    </fieldset>
    """
  end

  def input_group(%{variant: "cards"} = assigns) do
    ~H"""
    <fieldset class={"mbta-input-group #{@class}"}>
      <legend class="mbta-label">{@label}</legend>
      <div class={"mbta-input-group--cards #{if(@errors != [], do: "mbta-input--error")}"}>
        <.label
          :for={input <- @input}
          for={input_id(@form, @field) <> "_#{input.value}"}
          class="mbta-card"
        >
          <input
            class="mbta-input"
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
      <.feedback :for={msg <- @errors} kind={:error}>{msg}</.feedback>
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
