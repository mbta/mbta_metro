defmodule Storybook.Components.ModeIcons do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  def function, do: &MbtaMetro.Components.SystemIcons.mode_icon/1
  def render_source, do: :function

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations:
          for mode <- ["subway", "bus", "commuter-rail", "ferry", "the-ride"] do
            %Variation{
              id: String.to_atom("#{mode}_icon"),
              attributes: %{
                mode: mode
              }
            }
          end
      },
      %VariationGroup{
        id: :small_icons,
        description: "Small icons",
        variations:
          for mode <- ["subway", "bus", "commuter-rail", "ferry", "the-ride"] do
            %Variation{
              id: String.to_atom("#{mode}_sm_icon"),
              attributes: %{
                mode: mode,
                size: "small"
              }
            }
          end
      },
      %VariationGroup{
        id: :colored,
        variations:
          for line <-
                ~w(red-line mattapan-line orange-line green-line green-line-b green-line-c green-line-d green-line-e blue-line silver-line) do
            %Variation{
              id: String.to_atom("#{line}_subway_icon"),
              attributes: %{
                mode: "subway",
                line: line
              }
            }
          end
      }
    ] ++
      [
        %Variation{
          id: :custom_class,
          attributes: %{
            mode: "bus",
            class: "w-64 h-64 rotate-45"
          }
        }
      ]
  end
end
