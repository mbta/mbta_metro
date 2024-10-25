defmodule Storybook.Live.Map do
  @moduledoc false

  use PhoenixStorybook.Story, :live_component

  alias MbtaMetro.Live.Map

  def component, do: Map

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          class: "w-full h-96",
          click_handler: false
        }
      }
    ]
  end
end
