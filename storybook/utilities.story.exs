defmodule Storybook.Theme.Utilities do
  @moduledoc false

  use PhoenixStorybook.Story, :page

  def navigation do
    [
      {:app, "Application Colors"},
      {:system, "MBTA System Colors"}
    ]
  end

  def render(%{tab: :system} = assigns) do
    ~H"""
    <h2>MBTA System Colors</h2>
    <p class="my-4">CSS variables are available to use directly.</p>
    <%= for cls <- ~w(green-line orange-line red-line blue-line silver-line brand-bus ferry commuter-rail) do %>
      <div class="flex gap-lg w-full py-2 items-center">
        <div>
          <.code>var(--colors-{cls})</.code>
        </div>
        <div style={"background-color: var(--colors-#{cls});"} class="size-8"></div>
      </div>
    <% end %>
    <p class="my-4">
      To pair with the appropriate text color, these CSS utility classes will add the correct <.code>background-color</.code>, <.code>color</.code>, and
      <.code>fill</.code>
      for each system route or mode.
    </p>
    <%= for cls <- ~w(green-line orange-line red-line blue-line silver-line bus ferry commuter-rail) do %>
      <div class="flex gap-lg w-full py-2 items-center">
        <div>
          <.code>.mbta-route-{cls}</.code>
        </div>
        <div class={"font-bold mbta-route-#{cls} px-2"}>
          {String.split(cls, "-") |> Enum.map(&String.capitalize/1) |> Enum.intersperse(" ")}
        </div>
      </div>
    <% end %>
    """
  end

  def render(%{tab: :app} = assigns) do
    ~H"""
    <h2>Application Colors</h2>
    <%= for color <- ~w(charcoal cobalt amethyst emerald firebrick gold) do %>
      <h3>{String.capitalize(color)}</h3>
      <p>{description(color)}</p>
      <section class="mt-sm mb-lg">
        <div :for={n <- 1..9} class="flex gap-lg mb-1 items-center">
          <div class={[
            "size-10 bg-#{color}-#{n * 10}"
          ]} />
          <.code>var(--colors-{color}-{n * 10})</.code>
        </div>
      </section>
    <% end %>
    """
  end

  defp description("charcoal"), do: "The basic neutral color."

  defp description("cobalt"),
    do: "The primary color used in most interactive elements and as most accents."

  defp description("amethyst"), do: "Used on occasion for additional information."
  defp description("emerald"), do: "Used for success states."
  defp description("firebrick"), do: "Used for destructive actions or error states."
  defp description("gold"), do: "Used in warnings or alerts."

  defp code(assigns) do
    ~H"""
    {Phoenix.LiveView.TagEngine.component(
      &MbtaMetro.DocComponents.code/1,
      assigns,
      {__ENV__.module, __ENV__.function, __ENV__.file, __ENV__.line}
    )}
    """
  end
end
