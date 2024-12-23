defmodule Storybook.Components.Accordion do
  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.{Accordion, Feedback, Icon}

  def function, do: &Accordion.accordion/1

  def imports do
    [{Feedback, feedback: 1}, {Icon, icon: 1}]
  end

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          id: "default",
          open: false
        },
        slots: [
          ~s|<:heading>
  <.icon name="envelope" class="w-4 h-4 fill-charcoal-50" />
  <div>
    <p class="leading-4">
      Heading text
    </p>
    <small class="leading-none">
      Subheading text
    </small>
  </div>
</:heading>|,
          """
          <:content>
            <p>Any content can be inside</p>
          </:content>
          """
        ]
      },
      %Variation{
        id: :contained,
        description: "Contained",
        attributes: %{
          id: "default",
          variant: "contained",
          open: false
        },
        slots: [
          ~s|<:heading><.icon name="envelope" class="w-4 h-4 fill-cobalt-50" />Heading text</:heading>|,
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
          id: "open",
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
      }
    ]
  end
end
