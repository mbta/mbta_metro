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
      }
    ]
  end

  defp items do
    Faker.Util.sample_uniq(3, &Faker.Internet.email/0)
    |> Enum.map(&item/1)
  end

  defp item(value) do
    "<:item>#{value}</:item>"
  end
end
