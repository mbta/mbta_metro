defmodule Storybook.Components.Accordion do
  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.{Accordion, Inputs}

  def function, do: &Accordion.accordion/1

  def imports,
    do: [
      {Inputs, form_error: 1}
    ]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          open: false
        },
        slots: [
          ~s|<:heading>Heading text</:heading>|,
          """
          <:content>
            <p>Any content can be inside</p>
          </:content>
          """
        ]
      },
      %Variation{
        id: :open,
        description: "Initialized as open",
        attributes: %{
          open: true
        },
        slots: [
          ~s|<:heading>Heading text</:heading>|,
          """
          <:content>
            <p>Any content can be inside</p>
            <ul class="list-disc">
              <li class="ml-4">Thing 1</li>
              <li class="ml-4">Thing 2</li>
            </ul>
          </:content>
          """
        ]
      },
      %Variation{
        id: :with_extra,
        description: "With extra content",
        attributes: %{
          open: false
        },
        slots: [
          ~s|<:heading>Heading text</:heading>|,
          """
          <:content>
            <p>Any content can be inside</p>
          </:content>
          """,
          """
          <:extra>
            <.form_error>Something inside needs attention.</.form_error>
          </:extra>
          """
        ]
      }
    ]
  end
end
