defmodule Storybook.Components.Index do
  use PhoenixStorybook.Index

  def folder_name, do: "Components"
  def folder_icon, do: {:hero, "cube"}
  def folder_open?, do: true

  def entry("button"), do: [name: "Button"]
end
