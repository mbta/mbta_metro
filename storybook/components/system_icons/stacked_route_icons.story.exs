defmodule Storybook.Components.StackedRouteIcons do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  def function, do: &MbtaMetro.Components.SystemIcons.stacked_route_icon/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :example,
        attributes: %{
          lines: ["orange-line", "blue-line"]
        }
      },
      %VariationGroup{
        id: :gl,
        description: "Combined Green Line",
        variations: [
          %Variation{
            id: :all,
            description: "All",
            attributes: %{
              lines: ["green-line-b", "green-line-c", "green-line-d", "green-line-e"]
            }
          },
          %Variation{
            id: :part,
            description: "Partial",
            attributes: %{
              lines: ["green-line-b", "green-line-e"]
            }
          },
          %Variation{
            id: :single,
            description: "Single",
            attributes: %{
              lines: ["green-line-c"]
            }
          }
        ]
      },
      %Variation{
        id: :another_example,
        attributes: %{
          lines: ["green-line-c", "green-line-d", "orange-line"]
        }
      },
      %VariationGroup{
        id: :bus,
        variations: [
          %Variation{
            id: :one,
            attributes: %{
              names: ["450"]
            }
          },
          %Variation{
            id: :two,
            attributes: %{
              names: ["4", "222"]
            }
          },
          %Variation{
            id: :three,
            attributes: %{
              names: ["8", "SL4", "SL5"]
            }
          }
        ]
      },
      %VariationGroup{
        id: :mattapan,
        variations: [
          %Variation{
            id: :m,
            description: "Mattapan line",
            attributes: %{
              lines: ["red-line", "mattapan-line"]
            }
          },
          %Variation{
            id: :m2,
            description: "Mattapan line again",
            attributes: %{
              lines: ["mattapan-line"]
            }
          },
          %Variation{
            id: :r,
            description: "Red Line",
            attributes: %{
              lines: ["red-line"]
            }
          }
        ]
      },
      %Variation{
        id: :invalid,
        description: "Not a valid line",
        attributes: %{
          lines: ["unknown"]
        }
      }
    ]
  end
end
