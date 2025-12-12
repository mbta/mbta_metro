defmodule Storybook.Theme.Utilities do
  @moduledoc false

  use PhoenixStorybook.Story, :page

  def render(assigns) do
    ~H"""
    <div>
      <p class="my-4">
        These CSS utility classes will add the correct <.code>background-color</.code>, <.code>color</.code>, and
        <.code>fill</.code>
        for each system route or mode.
      </p>
      <%= for cls <- ~w(green-line orange-line red-line blue-line silver-line bus ferry commuter-rail) do %>
        <div class="flex gap-2 w-full py-2">
          <div class="px-2">
            <.code>.mbta-route-{cls}</.code>
          </div>
          <div class={"font-bold mbta-route-#{cls} px-2"}>
            {String.split(cls, "-") |> Enum.map(&String.capitalize/1) |> Enum.intersperse(" ")}
          </div>
        </div>
      <% end %>

      <h1>Other colors</h1>
      <%= for color <- ~w(cobalt emerald amethyst firebrick charcoal gold) do %>
      <h2 class="mt-4">{color}</h2>
      <section class="flex gap-sm">
        <%= for n <- 1..9 do %>
          <div>
            <div class={[
              "size-10 font-small flex flex-col justify-center items-center bg-#{color}-#{n * 10}"
            ]} />
            <div class="size-4">{n * 10}</div>
          </div>
        <% end %>
      </section>
      <% end %>
    </div>
    """
  end

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
