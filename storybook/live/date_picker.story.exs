defmodule Storybook.Live.DatePicker do
  @moduledoc false

  use PhoenixStorybook.Story, :live_component

  alias MbtaMetro.Components.Feedback
  alias MbtaMetro.Live.DatePicker

  def imports do
    [{Feedback, feedback: 1}]
  end

  def component, do: DatePicker

  def variations do
    now = DateTime.utc_now()

    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          id: "default-datepicker",
          config: %{
            default_date: now,
            enable_time: true,
            max_date: DateTime.shift(now, day: 7),
            min_date: DateTime.shift(now, day: -7)
          },
          field: %Phoenix.HTML.FormField{
            id: Faker.Lorem.word(),
            errors: [],
            field: Faker.Lorem.word(),
            form: %Phoenix.HTML.Form{},
            name: Faker.Lorem.word(),
            value: NaiveDateTime.utc_now()
          },
          label: "Date of birth",
          locale: "en"
        }
      },
      %Variation{
        id: :default_errors,
        description: "Default with errors",
        attributes: %{
          id: "error-datepicker",
          config: %{
            default_date: now,
            enable_time: true,
            max_date: DateTime.shift(now, day: 7),
            min_date: DateTime.shift(now, day: -7)
          },
          field: %Phoenix.HTML.FormField{
            id: Faker.Lorem.word(),
            errors: ["Pick a time in the future, please"],
            field: Faker.Lorem.word(),
            form: %Phoenix.HTML.Form{},
            name: Faker.Lorem.word(),
            value: NaiveDateTime.utc_now()
          },
          label: "Date of birth",
          locale: "en"
        }
      }
    ]
  end
end
