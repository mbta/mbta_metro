defmodule Storybook.Components.Spinner do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Spinner

  def function, do: &Spinner.spinner/1

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          aria_label: Faker.Lorem.word()
        }
      }
    ] ++ color_variations()
  end

  defp color_variations do
    ~w[blue green orange purple red silver yellow]
    |> Enum.map(&color_variation/1)
  end

  defp color_variation(color) do
    %Variation{
      id: String.to_atom(color),
      attributes: %{
        aria_label: Faker.Lorem.word(),
        color: color
      },
      description: String.capitalize(color)
    }
  end
end
