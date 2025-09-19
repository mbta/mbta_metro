defmodule Storybook.Components.Button do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.{Button, Icon}

  def function, do: &Button.button/1

  def imports do
    [{Icon, icon: 1}]
  end

  def variations do
    [
      %VariationGroup{
        id: :primary,
        description: "",
        variations: [
          %Variation{
            id: :default,
            attributes: %{text: "Default button"}
          },
          %Variation{
            id: :primary_disabled,
            attributes: %{
              "aria-disabled": true,
              text: "Disabled button"
            }
          },
          %Variation{
            id: :default_with_class,
            attributes: %{
              class: "-skew-x-12 opacity-50",
              text: "With custom classes"
            }
          },
          %Variation{
            id: :default_with_icon,
            attributes: %{
              text: "Default with icon"
            },
            slots: [
              """
              <:icon>
              <.icon name="comment" class="w-4 h-4 fill-white" />
              </:icon>
              """
            ]
          },
          %Variation{
            id: :primary_sm,
            attributes: %{
              size: "small",
              text: "Primary small button"
            }
          }
        ]
      },
      %VariationGroup{
        id: :secondary,
        description: "Secondary button, to use in accompaniment with a primary button.",
        variations: [
          %Variation{
            id: :secondary_default,
            attributes: %{
              text: "Secondary button",
              variant: "secondary"
            }
          },
          %Variation{
            id: :secondary_with_icon,
            attributes: %{
              text: "Secondary with icon",
              variant: "secondary"
            },
            slots: [
              """
              <:icon>
              <.icon name="star" class="w-4 h-4 fill-current" />
              </:icon>
              """
            ]
          },
          %Variation{
            id: :secondary_sm,
            attributes: %{
              variant: "secondary",
              size: "small",
              text: "Secondary small"
            }
          }
        ]
      },
      %Variation{
        id: :tertiary,
        attributes: %{
          variant: "tertiary",
          size: "small",
          text: "Tertiary button"
        },
        description:
          "Tertiary button, only available in small. Use only in contexts where Primary and Secondary are also used in the same view. Example: An “Edit” element button inside a modal with a “Save” and “Cancel” button."
      }
    ]
  end
end
