defmodule Storybook.Components.Spinner do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Spinner

  def function, do: &Spinner.spinner/1

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          aria_label: "Default"
        }
      }
    ]
  end
end
