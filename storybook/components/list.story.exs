defmodule Storybook.Components.List do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.List

  def function, do: &List.list/1

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        slots: items()
      },
      %Variation{
        id: :with_item_classes,
        description: "With item classes",
        slots: class_items()
      }
    ]
  end

  defp items do
    Faker.Util.sample_uniq(3, &Faker.Internet.email/0)
    |> Enum.map(fn value -> "<:item>#{value}</:item>" end)
  end

  defp class_items do
    ["red", "green", "blue"]
    |> Enum.map(fn value -> "<:item class=\"text-#{value}-500\">#{value}</:item>" end)
  end
end
