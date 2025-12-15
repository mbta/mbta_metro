defmodule Storybook.Components.Index do
  @moduledoc false

  use PhoenixStorybook.Index

  def folder_name, do: "Components"
  def folder_open?, do: true

  def entry("button"), do: [name: "Button"]
  def entry("input"), do: [name: "Input"]
  def entry("group_input"), do: [name: "Input group"]
end
