defmodule Storybook.Components.Button do
  @moduledoc false

  use PhoenixStorybook.Story, :live_component

  alias MbtaMetro.Live.DatePicker

  def component, do: DatePicker

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          name: Faker.Lorem.word(),
          value: Timex.now()
        }
      }
    ]
  end
end
