defmodule Storybook.DesignTokens.Index do
  @moduledoc false

  use PhoenixStorybook.Index

  def folder_name, do: "Design Tokens"
  def folder_open?, do: true
  def folder_index, do: 2

  def entry("base"), do: [name: "Base Tokens", index: 0]
  def entry("base_colors"), do: [name: "Base Colors", index: 1]
  def entry("colors"), do: [name: "System Colors", index: 1]
  def entry("semantic"), do: [name: "Semantic Colors", index: 2]
  def entry("component"), do: [name: "Component Colors", index: 3]
end
