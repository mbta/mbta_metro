defmodule Storybook.Components.Button do
  use PhoenixStorybook.Story, :live_component

  alias MbtaMetro.Live.Map

  @api_key Application.compile_env(:mbta_metro, :aws_location)[:api_key]
  @map_name Application.compile_env(:mbta_metro, :aws_location)[:map_name]
  @region Application.compile_env(:mbta_metro, :aws_location)[:region]

  def component, do: Map

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          api_key: @api_key,
          map_name: @map_name,
          region: @region,
          class: "w-full h-96",
          click_handler: false
        }
      }
    ]
  end
end
