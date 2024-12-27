defmodule Storybook.Components.InputGroup do
  use PhoenixStorybook.Story, :component

  import Phoenix.Component, only: [to_form: 1]

  alias MbtaMetro.Components.{Input, InputGroup}

  def function, do: &InputGroup.input_group/1

  def imports,
    do: [
      {Input, [input: 1]}
    ]

  def variations do
    [
      checkbox(),
      checkbox_button(),
      radio(),
      radio_button()
    ]
  end

  defp checkbox do
    %Variation{
      id: :checkbox,
      description: "Checkboxes (select multiple)",
      attributes: %{
        legend: "Favorite stations",
        type: "checkbox",
        name: "stations[]",
        form: to_form(%{}),
        field: :stations_checkbox_example,
        options: [
          {"Back Bay", "place-bbsta"},
          {"North Station", "place-north"},
          {"South Station", "place-sstat"}
        ]
      }
    }
  end

  defp checkbox_button do
    %Variation{
      id: :checkbox_button,
      description: "Checkbox Buttons (select multiple)",
      attributes: %{
        legend: "Favorite stations",
        type: "checkbox-button",
        name: "stations[]",
        form: to_form(%{}),
        field: :stations_checkbox_button_example,
        options: [
          {"Back Bay", "place-bbsta"},
          {"North Station", "place-north"},
          {"South Station", "place-sstat"}
        ]
      }
    }
  end

  defp radio do
    %Variation{
      id: :radio,
      description: "Radios (select one)",
      attributes: %{
        legend: "Favorite single station",
        type: "radio",
        name: "station",
        form: to_form(%{"station" => "place-harsq"}),
        field: :station_radio_example,
        options: [
          {"Harvard", "place-harsq"},
          {"Ruggles", "place-rugg"},
          {"Wonderland", "place-wondl"}
        ]
      }
    }
  end

  defp radio_button do
    %Variation{
      id: :radio_button,
      description: "Radio buttons (select one)",
      attributes: %{
        legend: "Favorite single station",
        type: "radio-button",
        name: "station",
        form: to_form(%{"station" => "place-harsq"}),
        field: :station_radio_button_example,
        class: "w-full",
        options: [
          {"Harvard", "place-harsq"},
          {"Ruggles", "place-rugg"},
          {"Wonderland", "place-wondl"}
        ]
      }
    }
  end
end
