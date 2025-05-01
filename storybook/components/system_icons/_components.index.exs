defmodule Storybook.Components.RouteIcons.Index do
  @moduledoc false

  use PhoenixStorybook.Index

  def folder_name, do: "System Icons"
  def folder_icon, do: {:hero, "trophy"}
  def folder_open?, do: true

  def entry("route_icons"), do: [name: "Route Icons"]
  def entry("stacked_icons"), do: [name: "Stacked Route Icons"]
  def entry("mode_icons"), do: [name: "Mode Icons"]
  def entry("examples"), do: [name: "Examples"]
end
