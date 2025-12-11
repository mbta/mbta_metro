defmodule Storybook.Components.InputGroup do
  use PhoenixStorybook.Story, :component

  import Phoenix.Component, only: [to_form: 1]

  alias MbtaMetro.Components.{Icon, Input, InputGroup, SystemIcons}

  def function, do: &InputGroup.input_group/1

  def imports,
    do: [
      {Icon, icon: 1},
      {Input, [label: 1]},
      {SystemIcons, [route_icon: 1]}
    ]

  def variations do
    [
      checkbox_button(),
      checkbox(),
      radio_button(),
      radio(),
      radio_cards(),
      radio_cards_with_errors()
    ]
  end

  defp checkbox do
    %Variation{
      id: :checkbox,
      description: "Checkbox (select multiple)",
      attributes: %{
        type: "checkbox",
        name: "stations_example[]",
        label: "Best stations",
        form: to_form(%{}),
        field: :stations_checkbox_example
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
        variant: "buttons",
        name: "stations[]",
        label: "Best stations",
        form: to_form(%{}),
        field: :stations_checkbox_button_example
      },
      slots: [
        """
        <:input value="place-harsq">
          <.route_icon line="red-line" /> Harvard
        </:input>
        """,
        """
        <:input value="place-rugg">
          <.route_icon line="orange-line" />
          Ruggles
        </:input>
        """,
        """
        <:input value="place-wondl">
          <.route_icon line="blue-line" />
          Wonderland
        </:input>
        """
      ]
    }
  end

  defp radio_cards do
    %Variation{
      id: :radio_cards_1,
      description: "Radio Cards (select one)",
      attributes: %{
        type: "radio",
        variant: "cards",
        name: "route1",
        label: "Best route",
        form: to_form(%{}),
        field: :routes_radio_cards_example1
      },
      slots: [
        """
        <:input value="Red">
          <div style="display: flex; flex-direction: column; row-gap: var(--spacing-xs);">
            <strong>Red Line</strong>
            <p>A mainstay in the Cambridge area, also the gateway to Arlington, Lexington, and other points north.</p>
          </div>
        </:input>
        """,
        """
        <:input value="Orange">
          <div>Orange Line</div>
        </:input>
        """,
        """
        <:input value="Blue">
          Blue Line
        </:input>
        """
      ]
    }
  end

  defp radio_cards_with_errors do
    %Variation{
      id: :radio_cards_2,
      description: "Radio Cards (with error message)",
      attributes: %{
        type: "radio",
        variant: "cards",
        name: "route2",
        label: "Best route",
        errors: ["Don't pick that one"],
        form: to_form(%{}),
        field: :routes_radio_cards_example2
      },
      slots: [
        """
        <:input value="1">1</:input>
        """,
        """
        <:input value="10">10</:input>
        """,
        """
        <:input value="350">350</:input>
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
        name: "station",
        label: "Favorite station",
        form: to_form(%{"station" => "place-harsq"}),
        field: :station_radio_example
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
        variant: "buttons",
        name: "stations_radio[]",
        label: "Worst station",
        form: to_form(%{}),
        field: :stations_radio_button_example
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
