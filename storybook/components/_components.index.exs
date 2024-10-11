defmodule Storybook.Components.Index do
  @moduledoc false

  use PhoenixStorybook.Index

  def folder_name, do: "Components"
  def folder_icon, do: {:hero, "cube"}
  def folder_open?, do: true

  def entry("button"), do: [name: "Button"]
  def entry("data_list"), do: [name: "DataList"]
  def entry("feedback"), do: [name: "Feedback"]
  def entry("flash"), do: [name: "Flash"]
  def entry("input"), do: [name: "Input"]
  def entry("input_group"), do: [name: "Input group"]
  def entry("modal"), do: [name: "Modal"]
  def entry("mode_selector"), do: [name: "Mode selector"]
  def entry("spinner"), do: [name: "Spinner"]
  def entry("table"), do: [name: "Table"]
end
