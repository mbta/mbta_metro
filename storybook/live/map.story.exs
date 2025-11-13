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
          id: "default-map",
          class: "w-full h-96",
          config: @config,
          lines: [
            %{
              color: "#ED8B00",
              width: 4,
              coordinates: [
                [-71.0583, 42.3630],
                [-71.0580, 42.3631],
                [-71.0581, 42.3631],
                [-71.0582, 42.3633],
                [-71.0584, 42.3635],
                [-71.0591, 42.3642],
                [-71.0601, 42.3653],
                [-71.0602, 42.3653]
              ]
            }
          ],
          pins: [
            # Haymarket
            [-71.0583, 42.3630],
            # North Station
            [-71.0602, 42.3653]
          ],
          points: [
            [-71.0581, 42.3631],
            [-71.0591, 42.3642]
          ]
        }
      },
      %Variation{
        id: :custom_icon,
        description: "Map with custom icon",
        attributes: %{
          id: "icon-map",
          class: "w-full h-96",
          config: @config,
          icons: [
            %{
              # North Station
              coordinates: [-71.0602, 42.3653],
              url: square_icon()
            }
          ]
        }
      }
    ]
  end

  defp square_icon do
    "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='32' height='32'%3E%3Cpolygon points='16,4 28,28 4,28' fill='green' stroke='black' stroke-width='2'/%3E%3C/svg%3E"
  end
end
