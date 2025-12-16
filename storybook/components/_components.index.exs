defmodule Storybook.Components.Index do
  @moduledoc false

  use PhoenixStorybook.Index

  def folder_name, do: "Components"
  def folder_open?, do: true

  def entry("button"), do: [name: "Button"]
  def entry("form"), do: [name: "Form Inputs"]
  def entry("inputgroup"), do: [name: "Input Group"]
end
