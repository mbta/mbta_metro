defmodule Storybook.Live.DatePicker do
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
          config: %{
            default_date: Timex.now(),
            enable_time: true,
            max_date: Timex.now() |> Timex.shift(days: 7),
            min_date: Timex.now() |> Timex.shift(days: -7)
          },
          field: %Phoenix.HTML.FormField{
            id: Faker.Lorem.word(),
            errors: [],
            field: Faker.Lorem.word(),
            form: %Phoenix.HTML.Form{},
            name: Faker.Lorem.word(),
            value: NaiveDateTime.utc_now()
          },
          locale: "en"
        }
      }
    ]
  end
end
