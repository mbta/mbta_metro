defmodule Storybook.Live.Map do
  @moduledoc false

  use PhoenixStorybook.Story, :live_component

  alias MbtaMetro.Live.Map

  @style Application.compile_env!(:mbta_metro, :map) |> Keyword.get(:style, %{})

  def component, do: Map

  def variations do
    [
      %Variation{
        id: :raster,
        description: "Raster map",
        attributes: %{
          class: "w-full h-96",
          click_handler: false,
          lines: [

          ],
          markers: [
            [-71.0613648253032, 42.36658107030566], # North Station
            [-71.05467810016113, 42.35208183348061] # South Station
          ],
          style: @style
        }
      },
    ]
  end
end
