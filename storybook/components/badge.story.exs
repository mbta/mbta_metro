defmodule Storybook.Components.Badge do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.{Badge, Icon}

  def function, do: &Badge.badge/1

  def imports do
    [{Icon, [icon: 1]}]
  end

  def variations do
    [
      %Variation{
        id: :circle,
        attributes: %{
          class: "text-white",
          color: "orange",
          type: "circle"
        },
        slots: [
          "OL"
        ]
      },
      %Variation{
        id: :circle_with_icon,
        attributes: %{
          color: "blue",
          type: "circle"
        },
        slots: [
          "<.icon name=\"ship\" class=\"w-4 h-4 fill-white\" />"
        ]
      },
      %Variation{
        id: :square,
        attributes: %{
          class: "text-yellow-800 rounded-sm",
          color: "yellow",
          type: "square"
        },
        slots: [
          "86"
        ]
      },
      %Variation{
        id: :square_with_icon,
        attributes: %{
          class: "shadow-[2px_2px_lightblue]",
          color: "red",
          type: "square"
        },
        slots: [
          "<.icon type=\"regular\" name=\"heart\" class=\"w-4 h-4 fill-white\" />"
        ]
      }
    ]
  end
end
