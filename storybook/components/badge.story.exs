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
          class: "bg-charcoal-80",
          variant: "circle"
        },
        slots: [
          "7"
        ]
      },
      %Variation{
        id: :circle_with_customization,
        attributes: %{
          class: "text-white bg-[#ed8b00]",
          variant: "circle"
        },
        slots: [
          "OL"
        ]
      },
      %Variation{
        id: :pill,
        attributes: %{
          class: "text-white bg-commuter-rail",
          variant: "pill"
        },
        slots: [
          "PURPLE"
        ]
      },
      %Variation{
        id: :circle_with_icon,
        attributes: %{
          class: "bg-ferry",
          variant: "circle"
        },
        slots: [
          "<.icon name=\"ship\" class=\"w-4 h-4 fill-black\" />"
        ]
      },
      %Variation{
        id: :square,
        attributes: %{
          class: "bg-emerald-70",
          variant: "square"
        },
        slots: [
          "5 Emails"
        ]
      },
      %Variation{
        id: :square_with_customizations,
        attributes: %{
          color: "transparent",
          class: "text-black border border-2 border-firebrick-30 !rounded-none",
          variant: "square"
        },
        slots: [
          "Close"
        ]
      },
      %Variation{
        id: :square_with_icon,
        attributes: %{
          class: "shadow-[2px_2px_lightblue] bg-firebrick-50",
          variant: "square"
        },
        slots: [
          "<.icon type=\"regular\" name=\"heart\" class=\"w-4 h-4 fill-white\" />"
        ]
      }
    ]
  end
end
