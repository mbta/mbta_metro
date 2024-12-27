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
      %Variation{
        id: :default,
        slots: [
          "Default Button Style"
        ],
        description: "Default"
      },
      %Variation{
        id: :primary_disabled,
        attributes: %{
          "aria-disabled": true
        },
        slots: [
          "Primary disabled button"
        ],
        description: "Primary disabled default button"
      },
      %Variation{
        id: :default_with_icon,
        slots: [
          """
          <.icon name="comment" class="w-4 h-4 fill-white" /> Default with icon
          """
        ],
        description: "Default with icon"
      },
      %Variation{
        id: :primary_sm,
        attributes: %{
          size: "small"
        },
        slots: [
          "Primary small button"
        ],
        description: "Primary small button"
      },
      %Variation{
        id: :primary_sm_disabled,
        attributes: %{
          size: "small",
          "aria-disabled": true
        },
        slots: [
          "Primary disabled small button"
        ],
        description: "Primary disabled small button"
      },
      %Variation{
        id: :secondary,
        attributes: %{
          variant: "secondary"
        },
        slots: [
          "Secondary button"
        ],
        description: "Secondary default button"
      },
      %Variation{
        id: :secondary_sm,
        attributes: %{
          variant: "secondary",
          size: "small"
        },
        slots: [
          "Secondary small button"
        ],
        description: "Secondary small button"
      }
    ]
  end
end
