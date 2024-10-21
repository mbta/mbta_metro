defmodule Storybook.Components.Badge do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Badge

  def function, do: &Badge.badge/1

  def variations do
    [
      %Variation{
        id: :circle,
        attributes: %{
          class: "text-white",
          color: "blue",
          type: "circle"
        },
        slots: [
          "BL"
        ]
      },
      %Variation{
        id: :circle_icon,
        attributes: %{
          color: "green",
          type: "circle"
        },
        slots: [
          "<Heroicons.bolt class=\"w-5 h-5 text-green-200\" />"
        ]
      },
      %Variation{
        id: :square,
        attributes: %{
          class: "text-yellow-800",
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
          color: "red",
          type: "square"
        },
        slots: [
          "<Heroicons.bolt_slash class=\"w-5 h-5 text-red-200\" />"
        ]
      }
    ]
  end
end
