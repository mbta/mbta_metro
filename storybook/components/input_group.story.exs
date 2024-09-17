defmodule Storybook.Components.InputGroup do
  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Inputs

  @form %{"favorite_modes" => [:commuter_rail, :subway, :bus, :ferry]}
        |> Phoenix.Component.to_form()

  @field @form[:favorite_modes]

  def function, do: &Inputs.input_group/1

  def imports,
    do: [
      {Inputs, [form_input: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :default_radio,
        description: "Default with radio inputs",
        attributes: %{
          field: @field,
          type: "radio"
        },
        slots: [
          ~s|<:input_item id="radio-1" value={:commuter_rail} checked={true} />|,
          ~s|<:input_item id="radio-2" value={:subway} checked={false} />|,
          ~s|<:input_item id="radio-3" value={:bus} checked={false} />|,
          ~s|<:input_item id="radio-4" value={:ferry} checked={false} />|
        ]
      },
      %Variation{
        id: :default_check,
        description: "Default with checkbox inputs",
        attributes: %{
          field: @field,
          type: "checkbox"
        },
        slots: [
          ~s|<:input_item id="check-1" value={:commuter_rail} checked={true} />|,
          ~s|<:input_item id="check-2" value={:subway} checked={false} />|,
          ~s|<:input_item id="check-3" value={:bus} checked={false} />|,
          ~s|<:input_item id="check-4" value={:ferry} checked={false} />|
        ]
      }
    ]
  end
end
