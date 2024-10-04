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
          legend: "Some label for the group here"
        },
        slots: [
          """
          <.input type="radio" name="things" value={1} label="Thing 1" />
          <.input type="radio" name="things" value={2} label="Thing 2" />
          """
        ]
      }
    ]
  end
end
