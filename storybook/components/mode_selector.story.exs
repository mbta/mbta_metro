defmodule Storybook.Components.ModeSelector do
  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.ModeSelector

  @form %{"favorite_modes" => [:commuter_rail, :subway, :bus, :ferry]}
        |> Phoenix.Component.to_form()

  @field @form[:favorite_modes]

  def function, do: &ModeSelector.mode_selector/1

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default (all modes)",
        attributes: %{
          field: @field
        }
      },
      %Variation{
        id: :subset,
        description: "Subset of modes with custom labels",
        attributes: %{
          field: @field,
          modes: [
            {"Rapid transit", :subway},
            {"Local buses", :bus}
          ]
        }
      }
    ]
  end
end
