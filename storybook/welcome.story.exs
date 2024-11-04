defmodule Storybook.Welcome do
  @moduledoc false

  use PhoenixStorybook.Story, :page

  def render(assigns) do
    ~H"""
    <iframe src="/demo" class="w-full h-[80vh]" />
    """
  end
end
