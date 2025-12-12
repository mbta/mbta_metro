defmodule Storybook.Components.Flash do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Flash

  def function, do: &Flash.flash/1

  @flash %{
    error: Faker.Lorem.sentence(),
    info: Faker.Lorem.sentence(),
    success: Faker.Lorem.sentence(),
    warning: Faker.Lorem.sentence()
  }

  def variations do
    Map.keys(@flash)
    |> Enum.map(&flash/1)
  end

  defp flash(kind) do
    %Variation{
      id: kind,
      description: kind |> Atom.to_string() |> String.capitalize(),
      attributes: %{
        flash: @flash,
        kind: kind,
        position: "relative",
        title: Faker.Lorem.sentence(3)
      },
      slots: [
        @flash[kind]
      ]
    }
  end
end
