defmodule Storybook.Live.DatePicker do
  @moduledoc false

  use PhoenixStorybook.Story, :live_component

  alias MbtaMetro.Live.DatePicker

  def component, do: DatePicker

  def variations do
    now = DateTime.utc_now()

    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          config: %{
            default_date: now,
            enable_time: true,
            max_date: now |> DateTime.shift(day: 7),
            min_date: now |> DateTime.shift(day: -7)
          },
          field: %Phoenix.HTML.FormField{
            id: Faker.Lorem.word(),
            errors: [],
            field: Faker.Lorem.word(),
            form: %Phoenix.HTML.Form{},
            name: Faker.Lorem.word(),
            value: NaiveDateTime.utc_now()
          }
        }
      }
    ]
  end
end
