defmodule Storybook.Components.BadgeStack do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.BadgeStack

  def function, do: &BadgeStack.badge_stack/1

  def variations do
    [
      %Variation{
        id: :circle,
        attributes: %{
          badges: [
            ["blue-500", "BL"],
            ["green-500", "E"],
            ["orange-500", "OL"],
            ["red-500", "RL"]
          ],
          class: "text-white",
          variant: "circle"
        }
      },
      %Variation{
        id: :square,
        attributes: %{
          badges: [
            ["yellow-300", "90"],
            ["yellow-300", "105"],
            ["yellow-300", "93"]
          ],
          variant: "square"
        }
      }
    ]
  end
end
