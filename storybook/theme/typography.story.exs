defmodule Storybook.Theme.Typography do
  @moduledoc false

  use PhoenixStorybook.Story, :page

  def doc,
    do: """
    The MBTA header styles have been designed to create a distinct reading hierarchy, improve vertical rhythm, and better match the typography used in Wayfinding signs throughout the transit system.
    """

  def navigation do
    [
      {:guidance, "Guidance", {:fa, "book"}},
      {:example, "Examples", {:fa, "cake", :solid}}
    ]
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= if @tab == :guidance do %>
        <p class="my-4">
          The fonts we use on the MBTA.com website are <strong>Helvetica Neue</strong>
          and <strong><a class="text-blue-500 underline" href="https://rsms.me/inter/">Inter</a></strong>. These are available to developers via the CSS utility classes
          <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
            font-headings
          </code>
          and <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">font-base</code>, respectively, or additionally through
          <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
            font-helvetica
          </code>
          and <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">font-inter</code>.
        </p>
        <p class="my-4">
          To increase legibility while staying within the Helvetic-ish family, we use Inter as our body font. The two fonts are visually similar to each other, but Inter is nicely optimized for screens and has better readability in running text. It is also free and open-source and has tabular numbers, which help for timetables and such.
        </p>
        <.goals />
        <.additional_guidelines />
      <% else %>
        <.examples />
      <% end %>
    </div>
    """
  end

  defp examples(assigns) do
    ~H"""
    <h1>
      <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
        &lt;h1&gt;
      </code>
      Heading 1
    </h1>
    <p>Body text</p>
    <h1>
      <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
        &lt;h1&gt;
      </code>
      Heading 1 Again
    </h1>
    <h2>
      <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
        &lt;h2&gt;
      </code>
      Heading 2
    </h2>
    <p>Body text. Adjacent headings are slightly closer together.</p>
    <h3>
      <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
        &lt;h3&gt;
      </code>
      Heading 3
    </h3>
    <p>Body text</p>
    <h4>
      <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
        &lt;h4&gt;
      </code>
      Heading 4
    </h4>
    <p>Body text</p>
    <h5>
      <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
        &lt;h5&gt;
      </code>
      Heading 5
    </h5>
    <p>Body text</p>
    <h6>
      <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
        &lt;h6&gt;
      </code>
      Heading 6
    </h6>
    <p>Body text</p>
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
            Exception:
            <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
              &lt;h1&gt;
            </code>
            for station pages or for Subway/Ferry/Commuter Rail line pages should be in all caps a la Wayfinding (e.g. 'SOUTH STATION', 'RED LINE'. etc.)
          </li>
        </ul>
      </li>
      <li>
        Only one
        <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
          &lt;h1&gt;
        </code>
        instance should appear on any given page.
      </li>
      <li>
        In compliance with accessibility standards, we do not skip heading ranks (for example, an
        <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
          &lt;h2&gt;
        </code>
        is never followed by an <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">&lt;h4&gt;</code>).
      </li>
      <li>
        <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
          &lt;h3&gt;
        </code>
        and
        <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">
          &lt;h4&gt;
        </code>
        are best used as the subheaders for the text that is divided into short columns of text on large screens, otherwise, subsections should be divided with <code class="text-amber-700 border border-1 border-amber-600 py-05 px-1 text-sm rounded">&lt;h2&gt;</code>.
      </li>
    </ul>
    """
  end

  defp additional_guidelines(assigns) do
    ~H"""
    <h2>Additional Guidelines</h2>
    <ol class="list-decimal pl-4">
      <li>Generously sized top-level headers</li>
      <li>Creating intentionally uneven margins between typography elements</li>
    </ol>
    <p class="my-4">
      Clear header hierarchy improves riders’ ability to skim and understand relationships between content. The space between a header and the content it accompanies is intentionally closer than the space between it and the other sections of the page.
    </p>
    """
  end
end
