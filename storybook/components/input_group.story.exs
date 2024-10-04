defmodule Storybook.Components.InputGroup do
  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.{Input, InputGroup}

  def function, do: &InputGroup.input_group/1

  def imports,
    do: [
      {Input, [input: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :check,
        description: "Checkboxes (select multiple)",
        attributes: %{
          legend: "Favorite stations",
          type: "checkbox",
          name: "stations[]",
          options: [
            {"North Station", "place-north"},
            {"South Station", "place-sstat"},
            {"Back Bay", "place-bbsta"}
          ]
        }
      },
      %Variation{
        id: :rad,
        description: "Radio buttons (select one)",
        attributes: %{
          legend: "Favorite single station",
          type: "radio",
          name: "stations",
          options: [
            {"North Station", "place-north"},
            {"South Station", "place-sstat"},
            {"Back Bay", "place-bbsta"},
            {"Wonderland", "place-wondl"},
            {"Harvard", "place-harsq"},
            {"Ruggles", "place-rugg"}
          ]
        }
      }
    ]
  end
end
