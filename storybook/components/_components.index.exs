defmodule Storybook.Components.Index do
  @moduledoc false

  use PhoenixStorybook.Index

  def folder_name, do: "Components"
  def folder_icon, do: {:hero, "cube"}
  def folder_open?, do: true

  def entry("accordion"), do: [name: "Accordion"]
  def entry("button"), do: [name: "Button"]
  def entry("fieldset"), do: [name: "Fieldset"]
  def entry("input_group"), do: [name: "Input group (checkboxes or radio inputs)"]
  def entry("mode_selector"), do: [name: "Mode selector"]
end
