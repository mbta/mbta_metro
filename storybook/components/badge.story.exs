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
          color_class: "bg-[#ed8b00]",
          type: "circle"
        },
        slots: [
          "OL"
        ]
      },
      %Variation{
        id: :pill,
        attributes: %{
          class: "text-white",
          color_class: "bg-purple-500",
          padding_class: "px-2 py-0.5",
          rounded_class: "rounded-full",
          type: "square"
        },
        slots: [
          "PURPLE"
        ]
      },
      %Variation{
        id: :circle_with_icon,
        attributes: %{
          class: "text-black",
          color_class: "bg-blue-100",
          type: "circle"
        },
        slots: [
          "<.icon name=\"ship\" class=\"w-4 h-4 fill-black\" />"
        ]
      },
      %Variation{
        id: :square,
        attributes: %{
          class: "min-w-8",
          color_class: "bg-blue-700 text-orange-100",
          type: "square"
        },
        slots: [
          "A"
        ]
      },
      %Variation{
        id: :square_with_rounded_corners,
        attributes: %{
          color_class: "bg-yellow-300 text-yellow-900",
          rounded_class: "rounded-md",
          type: "square"
        },
        slots: [
          "441/442"
        ]
      },
      %Variation{
        id: :square_with_icon,
        attributes: %{
          class: "shadow-[2px_2px_lightblue]",
          color_class: "bg-red-800",
          type: "square"
        },
        slots: [
          "<.icon type=\"regular\" name=\"heart\" class=\"w-4 h-4 fill-white\" />"
        ]
      }
    ]
  end
end
