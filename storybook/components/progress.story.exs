defmodule Storybook.Components.Spinner do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Progress

  def function, do: &Progress.progress/1

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          aria_label: "Default",
          value: :rand.uniform(100)
        }
      }
    ]
  end
end
