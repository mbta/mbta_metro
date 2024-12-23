defmodule Storybook.Components.Icon do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Icon

  def function, do: &Icon.icon/1

  def variations do
    Enum.map(Icon.icons(), fn {_file, name, type} ->
      icon_variation(type, name)
    end)
    |> Enum.sort_by(&Map.get(&1.attributes, :name))
  end

  defp icon_variation(type, name) do
    colors = ["cobalt", "emerald", "firebrick", "gold", "amethyst"]
    shades = ["20", "40", "70"]
    class = "fill-#{Faker.Util.pick(colors)}-#{Faker.Util.pick(shades)}"
    size = ["4", "16", "36"] |> Faker.Util.pick()

    %Variation{
      id: String.to_atom("#{type}_#{name}"),
      attributes: %{
        class: "h-#{size} w-#{size} #{class}",
        name: name,
        type: type
      }
    }
  end
end
