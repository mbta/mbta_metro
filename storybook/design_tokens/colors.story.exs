defmodule Storybook.DesignTokens.Colors do
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
        |> Enum.reject(fn [token_name, _] ->
          Enum.find(color_groups, &String.contains?(token_name, &1)) != nil
        end)
      )

    ~H"""
    <section>
      <.tokens_list tokens={@tokens} />
    </section>
    """
  end
end
