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
          "default"
        ],
        description: "Default"
      },
      %Variation{
        id: :default_with_icon,
        slots: [
          """
          <.icon name="comment" class="w-4 h-4 fill-white" /> Default with icon
          """
        ],
        description: "Default with icon"
      }
    ]
  end
end
