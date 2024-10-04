defmodule Storybook.Theme.Index do
  @moduledoc false

  use PhoenixStorybook.Index

  def folder_name, do: "Theme"
  def folder_icon, do: {:hero, "swatch"}
  def folder_open?, do: false

  def entry("color"), do: [name: "Color"]
  def entry("icons"), do: [name: "Icons"]
  def entry("typography"), do: [name: "Typography"]
end
