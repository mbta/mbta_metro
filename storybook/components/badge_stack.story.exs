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
            ["bg-blueLine", "BL"],
            ["bg-greenLine", "E"],
            ["bg-orangeLine", "OL"],
            ["bg-redLine", "RL"]
          ],
          class: "text-white",
          variant: "circle"
        }
      },
      %Variation{
        id: :square,
        attributes: %{
          badges: [
            ["bg-brandBus", "90"],
            ["bg-brandBus", "105"],
            ["bg-brandBus", "93"]
          ],
          variant: "square"
        }
      }
    ]
  end
end
