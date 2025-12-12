defmodule Storybook.Intro do
  @moduledoc false

  use PhoenixStorybook.Story, :page

  import MbtaMetro.DocComponents

  def doc,
    do:
      "MBTA Metro is an Elixir component library crafted for rider-facing Phoenix applications. It builds upon TID's Rider Design System, which defines standard colors, sizes, fonts and more. The project is still in its infancy, and we welcome questions or feedback in #design-system."

  def render(assigns) do
    ~H"""
    <h2>Setup</h2>
    <p>
      In summary:
      <ol class="list-decimal pl-lg">
        <li>
          Add
          <.code>:mbta_metro</.code>
          to your
          <.code>mix.exs</.code>
          and run <.code>mix deps.get</.code>.
        </li>
        <li>
          Import styles to your <.code>assets/css/app.css</.code>. This will look something like
          <.code>@import "../../deps/mbta_metro/priv/dist/metro.css";</.code>
        </li>
        <li>
          To use the LiveComponents, import the corresponding Phoenix client-side hooks and their dependencies into your <.code>assets/js/app.js</.code>. That code comes from
          <.code>deps/mbta_metro/priv/dist/metro.js</.code>
        </li>
        <li>Start using styles and components!</li>
      </ol>
    </p>
    <p>
      <a href="https://github.com/mbta/mbta_metro/blob/main/README.md#installing-mbta-metro-in-your-phoenix-application">
        Complete instructions are in the Github README.
      </a>
    </p>

    <h2>FAQ</h2>
    <h3>My application doesn't use Elixir</h3>
    <p>
      Styles are distributed in CSS files, so they can be used in any web application framework, or even in simple HTML files.
      <a href="https://github.com/mbta/mbta_metro/blob/main/priv/dist/metro.css">
        Download the compiled CSS here
      </a>
      and load it into your page or favorite bundler.
    </p>
    <p>
      See the <a href="/storybook/typography">Typography</a>
      and <a href="/storybook/utilities">Utilities</a>
      pages for CSS classes you can immediately use, or dig into the "Source" tab in any component page to learn about how to build non-Elixir counterparts.
    </p>
    <h3>Can this be used with Tailwind?</h3>
    <p>
      Yes! After <a href="https://github.com/mbta/mbta_metro/blob/main/priv/dist/metro.css">downloading the compiled CSS</a>, download and import
      <a href="https://github.com/mbta/mbta_metro/blob/main/priv/dist/tokens.js">the design tokens</a>
      directly in a Tailwind theme.
    </p>

    <h2>Looking ahead</h2>
    <p>
      We look forward to offering the following in the near future:
      <ol class="list-decimal pl-lg">
        <li>Versioning</li>
        <li>A direct download link from our CDN</li>
        <li>More components!</li>
      </ol>
    </p>
    """
  end
end
