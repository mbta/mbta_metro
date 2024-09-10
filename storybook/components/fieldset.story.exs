defmodule Storybook.Components.Fieldset do
  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Inputs

  def function, do: &Inputs.fieldset/1

  def imports,
    do: [
      {Inputs, [form_input: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          legend: "Favorite stations"
        },
        slots: [
          """
          <.form_input type="checkbox" name="stations[]" label="North Station" />
          <.form_input type="checkbox" name="stations[]" label="South Station" />
          <.form_input type="checkbox" name="stations[]" label="Back Bay" />
          """
        ]
      }
    ]
  end
end
