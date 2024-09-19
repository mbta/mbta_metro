defmodule Storybook.Components.Modal do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Modal

  def function, do: &Modal.modal/1

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          show: true
        },
        slots: [
          """
          <p><%= Faker.Lorem.paragraph() %></p>
          """
        ]
      }
    ]
  end
end
