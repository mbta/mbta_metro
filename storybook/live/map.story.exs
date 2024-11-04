defmodule Storybook.Live.Map do
  @moduledoc false

  use PhoenixStorybook.Story, :live_component

  alias MbtaMetro.Live.Map

  @config Application.compile_env(:mbta_metro, :map, %{})

  def component, do: Map

  def variations do
    [
      %Variation{
        id: :raster,
        description: "Raster map",
        attributes: %{
          class: "w-full h-96",
          config: @config,
          lines: [
            %{
              color: "orange-500",
              width: 4,
              coordinates: [
                [-71.05829, 42.36302],
                [-71.05803, 42.363099999999996],
                [-71.05805000000001, 42.363139999999994],
                [-71.05817, 42.363319999999995],
                [-71.05837000000001, 42.36353],
                [-71.05912000000001, 42.36418],
                [-71.0601, 42.36533],
                [-71.06021000000001, 42.36528]
              ]
            }
          ],
          pins: [
            # Haymarket
            [-71.05829, 42.36302],
            # North Station
            [-71.06021000000001, 42.36528]
          ],
          points: [
            [-71.05805000000001, 42.363139999999994],
            [-71.05912000000001, 42.36418]
          ]
        }
      }
    ]
  end
end
