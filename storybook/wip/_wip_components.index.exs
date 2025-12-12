defmodule Storybook.Components.Index do
  @moduledoc false

  use PhoenixStorybook.Index

  def folder_name, do: "WIP Components"
  def folder_icon, do: {:hero, "wrench"}
  def folder_open?, do: false

  def entry("accordion"), do: [name: "Accordion"]
  def entry("badge"), do: [name: "Badge"]
  def entry("data_list"), do: [name: "DataList"]
  def entry("feedback"), do: [name: "Feedback"]
  def entry("flash"), do: [name: "Flash"]
  def entry("icon"), do: [name: "Icon"]
  def entry("list"), do: [name: "List"]
  def entry("modal"), do: [name: "Modal"]
  def entry("mode_selector"), do: [name: "Mode selector"]
  def entry("progress"), do: [name: "Progress"]
  def entry("spinner"), do: [name: "Spinner"]
  def entry("table"), do: [name: "Table"]
end
