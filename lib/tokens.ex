defmodule MbtaMetro.Tokens do
  @moduledoc """
  Get the token names and values from the CSS files.
  """

  paths = Path.wildcard("assets/css/variables.*.css")

  for path <- paths do
    @external_resource path
  end

  # base and mbta system colors, other base tokens
  @base File.read!("assets/css/variables.base.css")
  # semantic and components
  @light File.read!("assets/css/variables.light.css")
  # semantic and components
  @dark File.read!("assets/css/variables.dark.css")

  @base_token_order ~w(
    colors
    border-radius
    border-width
    spacing
    line-height
    transition-duration
    font-size
    font-family
  )

  @component_token_order ~w(submenu menu footer navbar button-primary button-secondary button-tertiary annotation)

  # colors-
  @semantic_token_order ~w(action-primary error success warning colors)

  # list of variable name/value pairs
  defp load_tokens(file) do
    file
    |> String.split("\n")
    |> Stream.map(&String.split(&1, ":"))
    |> Stream.filter(&(Enum.count(&1) == 2))
    |> Stream.reject(&Enum.any?(&1, fn x -> x == "" end))
    |> Stream.map(fn line ->
      Enum.map(line, &(String.trim(&1) |> String.trim_trailing(";")))
    end)
    |> Enum.to_list()
  end

  def base_values() do
    load_tokens(@base)
    |> Enum.group_by(fn [token_name, _] ->
      Enum.find(@base_token_order, &String.contains?(token_name, &1))
    end)
  end

  def semantic_values(mode \\ :light) do
    mode_file(mode)
    |> load_tokens()
    |> Enum.group_by(fn [token_name, _] ->
      Enum.find(@semantic_token_order, &String.contains?(token_name, &1))
    end)
    |> Enum.reject(fn {name, _} -> is_nil(name) end)
    |> Map.new()
  end

  def component_values(mode \\ :light) do
    mode_file(mode)
    |> load_tokens()
    |> Enum.group_by(fn [token_name, _] ->
      Enum.find(@component_token_order, &String.contains?(token_name, &1))
    end)
    |> Enum.reject(fn {name, _} -> is_nil(name) end)
    |> Map.new()
  end

  defp mode_file(:light), do: @light
  defp mode_file(:dark), do: @dark
end
