defmodule Storybook.Components.DataList do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.DataList

  def function, do: &DataList.data_list/1

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
    %{
      id: :rand.uniform(10),
      first_name: Faker.Person.first_name(),
      last_name: Faker.Person.last_name(),
      email: Faker.Internet.email()
    }
    |> Enum.map(&item/1)
  end

  def item({title, value}) do
    "<:item title=\"#{title}\"}>#{value}</:item>"
  end
end
