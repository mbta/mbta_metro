defmodule Storybook.Components.Icon do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Icon

  def function, do: &Icon.icon/1

  def variations do
    Enum.map(Icon.icons(), fn {_file, name, type} ->
      icon_variation(type, name)
    end)
  end

  defp icon_variation(type, name) do
    %Variation{
      id: String.to_atom("#{type}_#{name}"),
      attributes: %{
        class: "h-7 w-7",
        name: name,
        type: type
      }
    }
  end
end
