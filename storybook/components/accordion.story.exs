defmodule Storybook.Components.Accordion do
  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.{Accordion, Feedback, Icon, Input}

  def function, do: &Accordion.accordion/1

  def imports do
    [{Feedback, feedback: 1}, {Icon, icon: 1}, {Input, input: 1}]
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
        id: :default_custom,
        description: "Default (custom style)",
        attributes: %{
          id: "default-custom",
          open: false
        },
        slots: [
          ~s|<:heading><.icon name="envelope" class="w-4 h-4 fill-green-500 group-open:fill-red-800" /><span class="text-green-800 font-extrabold text-sm italic group-open:text-orange-700 group-open:not-italic group-open:text-2xl group-open:font-extralight">Heading text</span></:heading>|,
          """
          <:content>
            <p>Use the <kbd>group-open:</kbd> prefix to apply styles when the accordion is open.</p>
          </:content>
          """
        ]
      },
      %Variation{
        id: :multiselect,
        description: "Multiselect",
        attributes: %{
          id: "multiselect",
          variant: "multiselect",
          open: false
        },
        slots: [
          ~s|<:heading>Choose something</:heading>|,
          """
          <:content>
            <.input name="choice" value="" type="radio" label="Yes" />
            <.input name="choice" value="" type="radio" label="Okay" />
            <.input name="choice" value="" type="radio" label="No" />
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
