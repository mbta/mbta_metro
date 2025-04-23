defmodule Storybook.Components.RouteIcons do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.SystemIcons

  @example_names [
    "SL1",
    "SL2",
    "SL3",
    "1",
    "62/76",
    "222",
    "558"
  ]

  def function, do: &SystemIcons.route_icon/1
  def render_source, do: :function

  def variations do
    [
      %VariationGroup{
        id: :default_route_group,
        description: "Lines, default size",
        variations:
          for line <- SystemIcons.supported_lines() do
            %Variation{
              id: String.to_atom("#{line}_default"),
              attributes: %{
                line: line
              }
            }
          end
      },
      %VariationGroup{
        id: :small_route_group,
        description: "Lines, small size",
        variations:
          for line <- SystemIcons.supported_lines() do
            %Variation{
              id: String.to_atom("#{line}_small"),
              attributes: %{
                line: line,
                size: "small"
              }
            }
          end
      },
      %Variation{
        id: :line_custom,
        attributes: %{
          line: "blue-line",
          class: "ring-4 ring-cobalt-60 tracking-widest"
        }
      },
      %VariationGroup{
        id: :default_route_group_names,
        description: "Names, default size",
        variations:
          for name <- @example_names do
            %Variation{
              id: String.to_atom("#{name}_default"),
              attributes: %{
                name: name
              }
            }
          end
      },
      %VariationGroup{
        id: :small_route_group_names,
        description: "Names, small size",
        variations:
          for name <- @example_names do
            %Variation{
              id: String.to_atom("#{name}_small"),
              attributes: %{
                name: name,
                size: "small"
              }
            }
          end
      },
      %Variation{
        id: :name_custom,
        attributes: %{
          name: "36",
          class: "ring-4 ring-firebrick-70 line-through font-light"
        }
      }
    ]
  end
end
