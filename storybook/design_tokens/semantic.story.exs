defmodule Storybook.DesignTokens.Semantic do
  use PhoenixStorybook.Story, :page

  import MbtaMetro.DocComponents

  def doc,
    do:
      "All Semantic colors have a Light and Dark mode and values. Many also have both foreground and background values, and some have values for state such as active, hover, disabled etc."

  def navigation,
    do: [
      {:light, "Light Mode"},
      {:dark, "Dark Mode"}
    ]

  def render(assigns) do
    assigns = assign(assigns, :tokens, MbtaMetro.Tokens.semantic_values(assigns.tab))

    ~H"""
    <ul class="list-disc pl-lg">
      <li>
        <.code>text-primary</.code>,
        <.code>text-secondary</.code>
        and
        <.code>text-tertiary</.code>
        meet WCAG 2.1 AA contrast guidelines for text and perceivable elements such as borders when used on top of <.code>background-primary</.code>,
        <.code>background-secondary</.code>
        and <.code>background-tertiary</.code>. Any level of text can sit on any level of background and retain WCAG 2.1 AA compliance.
      </li>
      <li>
        <.code>error</.code>, <.code>success</.code>, and
        <.code>warning</.code>
        are meant to be used for flashes and validation messages, and have both foreground (e.g. text) and background (e.g. containing element/card) properties, as well as an active state color.
      </li>
    </ul>
    <section :for={k <- ~w(action-primary error success warning colors)}>
      <h2>{k}</h2>
      <.tokens_list tokens={Map.get(@tokens, k)} />
    </section>
    """
  end
end
