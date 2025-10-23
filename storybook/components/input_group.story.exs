defmodule Storybook.Components.InputGroup do
  use PhoenixStorybook.Story, :component

  import Phoenix.Component, only: [to_form: 1]

  alias MbtaMetro.Components.{Icon, Input, InputGroup}

  def function, do: &InputGroup.input_group/1

  def imports,
    do: [
      {Icon, icon: 1},
      {Input, [label: 1]}
    ]

  def variations do
    [
    checkbox_button(),
      checkbox(),
      radio_button(),
      radio(),
    ]
  end

  defp checkbox do
    %Variation{
      id: :checkbox,
      description: "Checkbox (select multiple)",
      attributes: %{
        type: "checkbox",
        as_buttons: false,
        name: "stations_example[]",
        label: "Best stations",
        form: to_form(%{}),
        field: :stations_checkbox_example,
      },
      slots: [
        """
        <:input value="place-harsq">
          <.icon name="envelope" class="w-4 h-4 fill-green-500 group-open:fill-red-800" /> Harvard
        </:input>
        """,
        """
        <:input value="place-rugg">
          Ruggles
        </:input>
        """,
        """
        <:input value="place-wondl">
          Wonderland
        </:input>
        """
      ]
    }
  end

  defp checkbox_button do
    %Variation{
      id: :checkbox_button,
      description: "Checkbox Buttons (select multiple)",
      attributes: %{
        type: "checkbox",
        as_buttons: true,
        name: "stations[]",
        label: "Best stations",
        form: to_form(%{}),
        field: :stations_checkbox_button_example,
      },
      slots: [
        """
        <:input value="place-harsq">
          <.icon name="ship" class="w-4 h-4 fill-black" /> Harvard
        </:input>
        """,
        """
        <:input value="place-rugg">
          Ruggles
        </:input>
        """,
        """
        <:input value="place-wondl">
          Wonderland
        </:input>
        """
      ]
    }
  end

  defp radio do
    %Variation{
      id: :radio,
      description: "Radios (select one)",
      attributes: %{
        type: "radio",
        as_buttons: false,
        name: "station",
        label: "Favorite station",
        form: to_form(%{"station" => "place-harsq"}),
        field: :station_radio_example,
      },
      slots: [
        """
        <:input value="place-harsq">
          Harvard
        </:input>
        """,
        """
        <:input value="place-rugg">
          Ruggles
        </:input>
        """,
        """
        <:input value="place-wondl">
          Wonderland
        </:input>
        """
      ]
    }
  end

  defp radio_button do
    %Variation{
      id: :radio_button,
      description: "Radio Buttons (select one)",
      attributes: %{
        type: "radio",
        as_buttons: true,
        name: "stations_radio[]",
        label: "Worst station",
        form: to_form(%{}),
        field: :stations_radio_button_example,
      },
      slots: [
        """
        <:input value="place-harsq">
          <.icon name="ship" class="w-4 h-4 fill-black" /><span>Harvard</span>
        </:input>
        """,
        """
        <:input value="place-rugg">
          Ruggles
        </:input>
        """,
        """
        <:input value="place-wondl">
          Wonderland
        </:input>
        """,
        """
        <:input value="place-jaksn">
        <span>Jackson Square</span><.icon name="circle" class="w-4 h-4 fill-orange-line" />
        </:input>
        """
      ]
    }
  end
end
