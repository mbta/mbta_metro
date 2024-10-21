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
            ["blue", "BL"],
            ["green", "E"],
            ["orange", "OL"],
            ["red", "RL"],
          ],
          class: "text-white",
          type: "circle"
        }
      },
      %Variation{
        id: :square,
        attributes: %{
          badges: [
            ["yellow", "90"],
            ["yellow", "105"],
            ["yellow", "93"],
          ],
          type: "square"
        }
      }
    ]
  end
end
