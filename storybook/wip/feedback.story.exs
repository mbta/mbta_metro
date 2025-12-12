defmodule Storybook.Components.Feedback do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Feedback

  def function, do: &Feedback.feedback/1

  @feedback %{
    error: Faker.Lorem.sentence(),
    info: Faker.Lorem.sentence(),
    success: Faker.Lorem.sentence(),
    warning: Faker.Lorem.sentence()
  }

  def variations do
    Map.keys(@feedback)
    |> Enum.map(&feedback/1)
  end

  defp feedback(kind) do
    %Variation{
      id: kind,
      description: kind |> Atom.to_string() |> String.capitalize(),
      attributes: %{
        kind: kind
      },
      slots: [
        Faker.Lorem.sentence(3)
      ]
    }
  end
end
