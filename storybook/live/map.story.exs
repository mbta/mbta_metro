defmodule Storybook.Live.Map do
  @moduledoc false

  use PhoenixStorybook.Story, :live_component

  alias MbtaMetro.Live.Map

  @api_key Application.compile_env(:mbta_metro, :map)[:api_key]
  def component, do: Map

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default",
        attributes: %{
          api_key: @api_key,
          class: "w-full h-96",
          click_handler: false
        }
      }
    ]
  end
end
