defmodule Storybook.Components.Accordion do
  use PhoenixStorybook.Story, :live_component

  alias MbtaMetro.Live.Accordion
  alias MbtaMetro.Components.Feedback

  def component, do: Accordion

  def imports do
    [{Feedback, feedback: 1}]
  end

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          open: false
        },
        slots: [
          ~s|<:heading><Heroicons.bolt class="w-4 h-4 inline-flex mr-2" />Heading text that is extra long to display wrapping</:heading>|,
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
            <.feedback kind={:error}>Something inside needs attention.</.feedback>
          </:extra>
          """
        ]
      }
    ]
  end
end
