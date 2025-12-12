defmodule Storybook.Root do
  @moduledoc false

  use PhoenixStorybook.Index

  def entry("intro"), do: [name: "Introduction", index: 1]
  def entry("tokens"), do: [name: "Design Tokens", index: 2]
  def entry("typography"), do: [name: "Typography", index: 3]
  def entry("utilities"), do: [name: "Utilities", index: 4]
end
