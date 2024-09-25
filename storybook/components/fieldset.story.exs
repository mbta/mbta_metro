defmodule Storybook.Components.Fieldset do
  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.{Input, InputGroup}

  def function, do: &InputGroup.fieldset/1

  def imports,
    do: [
      {Input, [input: 1]}
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
          <.input type="checkbox" name="stations[]" label="North Station" />
          <.input type="checkbox" name="stations[]" label="South Station" />
          <.input type="checkbox" name="stations[]" label="Back Bay" />
          """
        ]
      }
    ]
  end
end
