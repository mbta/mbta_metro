defmodule Storybook.Root do
  @moduledoc false

  use PhoenixStorybook.Index

  def folder_name, do: "MbtaMetro"

  def entry("welcome") do
    [
      name: "Welcome to This Page"
    ]
  end
end
