defmodule Storybook.Components.Button do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Button

  def function, do: &Button.button/1

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        slots: [
          "Button"
        ]
      }
    ]
  end
end
