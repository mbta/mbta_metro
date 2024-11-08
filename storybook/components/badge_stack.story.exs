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
            ["bg-blue-500", "BL"],
            ["bg-green-500", "E"],
            ["bg-orange-500", "OL"],
            ["bg-red-500", "RL"]
          ],
          class: "text-white",
          type: "circle"
        }
      },
      %Variation{
        id: :square,
        attributes: %{
          badges: [
            ["bg-yellow-400", "90"],
            ["bg-yellow-400", "105"],
            ["bg-yellow-400", "93"]
          ],
          type: "square"
        }
      }
    ]
  end
end
