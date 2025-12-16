defmodule Storybook.DesignTokens.BaseColors do
  use PhoenixStorybook.Story, :page

  import MbtaMetro.DocComponents

  def render(assigns) do
    color_groups = ~w(charcoal cobalt gold firebrick emerald amethyst black white)

    assigns =
      assign(
        assigns,
        :tokens,
        MbtaMetro.Tokens.base_values()
        |> Map.get("colors")
        |> Enum.group_by(fn [token_name, _] ->
          Enum.find(color_groups, &String.contains?(token_name, &1))
        end)
      )
      |> assign(:color_groups, color_groups)

    ~H"""
    <section :for={k <- @color_groups}>
      <h2>{k}</h2>
      <.tokens_list tokens={Map.get(@tokens, k)} />
    </section>
    """
  end
end
