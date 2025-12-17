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
      radio()
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
      ],
      note: """
      Allows users to select 1 or more options from a list.

      ### When to use

      * **There is 1 or more valid responses.** When a user can select any number of options from a list.

      * **Each option is a yes/no or true/false answer.**

      ### When to consider something else

      * **Only one response is wanted.** If only one response is desired, such as a single choice on a scale, consider `radio` or `select`.
      """
    }
  end

  defp checkbox_button do
    %Variation{
      id: :checkbox_button,
      description: "Checkbox Buttons (select multiple)",
      attributes: %{
        type: "checkbox",
        as_buttons: true,
        required: true,
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
      ],
      note: """
      Allows users to select 1 or more options from a list, styled as horizontal segmented buttons.

      ### When to use

      * **Vertical compactness is paramount.** Use sparingly only as a control for other content on the page, such as mode filters.

      ### When to consider something else

      * **Only one response is wanted.** If only one response is desired, such as a single choice on a scale, consider `radio` with the `as_buttons` property.
      """
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
      ],
      note: """
      A pre-set list of options where only 1 option can be selected at a time.

      ### When to use

      * **Asking a multiple choice question that has only 1 answer.** For example: "Choose a direction: Inbound or Outbound"

      ### When to consider something else

      * **There are more than 7 options.** Consider a `select` component instead.
      """
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
      ],
      note: """
      Allows users to select only 1 one option from a list, styled as horizontal segmented buttons.

      ### When to use

      * **Vertical compactness is paramount.** Use sparingly only as a control for other content on the page, such selecting a timeframe for a planned trip.

      ### When to consider something else

      * **More than one response is needed.** If more than one response is desired, consider `checkbox` with the `as_buttons` property.
      """
    }
  end
end
