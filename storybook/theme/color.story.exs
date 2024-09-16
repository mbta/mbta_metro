defmodule Storybook.Theme.Color do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Swatch

  def function, do: &Swatch.swatch/1

  def variations do
    ~w[blue green purple red yellow]
    |> Enum.map(fn color ->
      %Variation{
        id: String.to_atom(color),
        attributes: %{
          name: color,
        },
        description: String.capitalize(color),
      }
    end)
  end
end
