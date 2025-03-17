defmodule Storybook.Theme.Typography do
  @moduledoc false

  use PhoenixStorybook.Story, :page

  def render(assigns) do
    ~H"""
    <div>
      <p class="my-4">
        The fonts we use on the MBTA.com website are <strong>Helvetica Neue</strong>
        and <strong><a class="text-blue-500 underline" href="https://rsms.me/inter/">Inter</a></strong>. These are available to developers via the CSS utility classes
        <.code>.font-headings</.code>
        and
        <.code>.font-base</.code>, respectively, or additionally through
        <.code>.font-helvetica</.code>
        and
        <.code>.font-inter</.code>.
      </p>
      <p class="my-4">
        To increase legibility while staying within the Helvetic-ish family, we use Inter as our body font. The two fonts are visually similar to each other, but Inter is nicely optimized for screens and has better readability in running text. It is also free and open-source and has tabular numbers, which help for timetables and such.
      </p>
      <.goals />
    </div>
    """
  end

  defp heading_tag_code(assigns) do
    ~H"""
    <.code class="border border-1 border-amber-600 rounded">{"<h#{@num}>"}</.code>
    """
  end

  defp goals(assigns) do
    ~H"""
    <h2>Goals</h2>
    <ul class="pl-4 list-disc">
      <li>
        In general, the header text should be in Title Case.
        <ul class="pl-4 list-disc">
          <li>
            Exception: <.heading_tag_code num={1} />
            for station pages or for Subway/Ferry/Commuter Rail line pages should be in all caps a la Wayfinding (e.g. 'SOUTH STATION', 'RED LINE'. etc.)
          </li>
        </ul>
      </li>
      <li>
        Only one <.heading_tag_code num={1} /> instance should appear on any given page.
      </li>
      <li>
        In compliance with accessibility standards, we do not skip heading ranks (for example, an
        <.heading_tag_code num={2} /> is never followed by an <.heading_tag_code num={4} />).
      </li>
      <li>
        <.heading_tag_code num={3} /> and <.heading_tag_code num={4} />
        are best used as the subheaders for the text that is divided into short columns of text on large screens, otherwise, subsections should be divided with
        <.heading_tag_code num={2} />.
      </li>
    </ul>
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
