defmodule Storybook.DesignTokens.Component do
  use PhoenixStorybook.Story, :page

  import MbtaMetro.DocComponents

  def doc,
    do: "All component colors have values for Light and Dark mode."

  def navigation,
    do: [
      {:light, "Light Mode"},
      {:dark, "Dark Mode"}
    ]

  def render(assigns) do
    assigns = assign(assigns, :tokens, MbtaMetro.Tokens.component_values(assigns.tab))

    ~H"""
    <div class={"#{if(@tab == :dark, do: "mbta-metro-dark-mode")} p-xl"}>
      <section :for={
        k <- ~w(submenu menu footer navbar button-primary button-secondary button-tertiary annotation)
      }>
        <h2>{k}</h2>
        <.tokens_list tokens={Map.get(@tokens, k) |> Enum.sort()} />
      </section>
    </div>
    """
  end
end
