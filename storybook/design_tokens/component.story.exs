defmodule Storybook.DesignTokens.Component do
  use PhoenixStorybook.Story, :page

  import MbtaMetro.DocComponents

  def doc,
    do:
      "Design tokens are the smallest building blocks of any design system. Using design tokens to design and build components helps reduce cognitive load for both designers and developers. By intentionally limiting choices for colors, typography, borders, and spacing to ones that harmonize, the result is faster design and development time, and a more consistent interface."

  def navigation,
    do: [
      {:light, "Light Mode"},
      {:dark, "Dark Mode"}
    ]

  def render(assigns) do
    assigns = assign(assigns, :tokens, MbtaMetro.Tokens.component_values(assigns.tab))

    ~H"""
    <section :for={
      k <- ~w(submenu menu footer navbar button-primary button-secondary button-tertiary annotation)
    }>
      <h2>{k}</h2>
      <.tokens_list tokens={Map.get(@tokens, k)} />
    </section>
    """
  end
end
