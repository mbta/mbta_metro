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
              name: "mode-subway-default",
              type: "system"
            }
          ]
        }
      },
      %Variation{
        id: :custom_icons_with_anchors,
        description: "Map with custom icon and custom anchors",
        attributes: %{
          id: "icon-map",
          class: "w-full h-96",
          config: @config,
          icons: [
            %{
              # North Station
              anchor: "bottom",
              coordinates: [-71.0602, 42.3653],
              name: "heart",
              type: "regular"
            },
            %{
              # South Station
              anchor: "bottom-left",
              coordinates: [-71.0552, 42.3522],
              name: "flag",
              type: "regular"
            }
          ]
        }
      }
    ]
  end
end
