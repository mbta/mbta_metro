defmodule Storybook.Components.Table do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Table

  def function, do: &Table.table/1

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          rows: rows()
        },
        slots: [
          """
          <:col :let={user} label="ID"><%= user.id %></:col>
          <:col :let={user} label="First Name"><%= user.first_name %></:col>
          <:col :let={user} label="Last Name"><%= user.last_name %></:col>
          <:col :let={user} label="Email"><%= user.email %></:col>
          """
        ]
      }
    ]
  end

  defp rows do
    Enum.to_list(1..5)
    |> Enum.map(&row/1)
  end

  def row(id) do
    %{
      id: id,
      first_name: Faker.Person.first_name(),
      last_name: Faker.Person.last_name(),
      email: Faker.Internet.email()
    }
  end
end
