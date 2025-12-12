defmodule Storybook.Intro do
  @moduledoc false

  use PhoenixStorybook.Story, :page

  def doc, do: "Your very first steps into using Phoenix Storybook"

  def render(assigns) do
      ~H"""
      <div class="psb-welcome-page">
        <p>
          We generated your storybook with an example of a page and a component.
          Explore the generated <code class="psb:inline">*.story.exs</code>
          files in your <code class="inline">/storybook</code>
          directory. When you're ready to add your own, just drop your new story & index files into the same directory and refresh your storybook.
        </p>


      </div>
      """
    end
end
