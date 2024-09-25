defmodule MbtaMetro.Components.InputGroup do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Input, only: [input: 1]

  attr :type, :string, values: ~W(checkbox radio)

  attr :field, Phoenix.HTML.FormField,
    required: true,
    doc: "a form field struct retrieved from the form, for example: @form[:color]"

  attr :rest, :global

  slot :input_item, doc: "Items to render as a list" do
    attr :id, :string
    attr :label, :string, doc: "The label displayed. The value will be used as default."
    attr :value, :any, required: true, doc: "The value assumed then the item is checked"
    attr :checked, :boolean
  end

  def input_group(assigns) do
    ~H"""
    <ul class="m-0 p-0 flex flex-col sm:flex-row list-none">
      <li
        :for={item <- @input_item}
        class={[
          "border border-solid border-slate-200",
          "has-[:checked]:bg-slate-100 has-[:checked]:border-slate-700",
          "first:max-sm:rounded-t-lg last:max-sm:rounded-b-lg",
          "sm:first:rounded-l-lg sm:last:rounded-r-lg"
        ]}
      >
        <.input
          id={item.id}
          type={@type}
          field={@field}
          label={item[:label]}
          value={item.value}
          checked={item[:checked]}
          multiple={if(@type == "checkbox", do: "true")}
          {@rest}
        />
      </li>
    </ul>
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
      <legend class="font-semifold text-slate-600 text-sm"><%= @legend %></legend>
      <%= render_slot(@inner_block) %>
    </fieldset>
    """
  end
end
