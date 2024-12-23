defmodule Storybook.Theme.Color do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Swatch

  def function, do: &Swatch.swatch/1

  def variations do
    ~w[cobalt emerald amethyst firebrick charcoal gold]
    |> Enum.map(fn color ->
      %Variation{
        id: String.to_atom(color),
        attributes: %{
          color: color
        },
        description: String.capitalize(color)
      }
    end)
  end
end
