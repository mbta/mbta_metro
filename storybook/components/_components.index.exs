defmodule Storybook.Components.Index do
  @moduledoc false

  use PhoenixStorybook.Index

  def folder_name, do: "Components"
  def folder_icon, do: {:hero, "cube"}
  def folder_open?, do: true

  def entry("accordion"), do: [name: "Accordion"]
  def entry("badge"), do: [name: "Badge"]
  def entry("badge_stack"), do: [name: "Badge stack"]
  def entry("button"), do: [name: "Button"]
  def entry("data_list"), do: [name: "DataList"]
  def entry("feedback"), do: [name: "Feedback"]
  def entry("flash"), do: [name: "Flash"]
  def entry("icon"), do: [name: "Icon"]
  def entry("input"), do: [name: "Input"]
  def entry("input_group"), do: [name: "Input group"]
  def entry("list"), do: [name: "List"]
  def entry("modal"), do: [name: "Modal"]
  def entry("mode_selector"), do: [name: "Mode selector"]
  def entry("progress"), do: [name: "Progress"]
  def entry("spinner"), do: [name: "Spinner"]
  def entry("table"), do: [name: "Table"]
end
