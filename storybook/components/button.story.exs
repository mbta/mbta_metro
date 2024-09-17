defmodule Storybook.Components.Button do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Button

  def function, do: &Button.button/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          "default"
        ],
        description: "Default"
      }
    ] ++
      (~w[blue green orange purple red silver yellow]
       |> Enum.map(fn color ->
         %Variation{
           id: String.to_atom(color),
           attributes: %{
             color: color
           },
           slots: [
             color
           ],
           description: String.capitalize(color)
         }
       end))
  end
end
