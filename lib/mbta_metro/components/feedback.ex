defmodule MbtaMetro.Components.Feedback do
  @moduledoc false

  use Phoenix.Component

  attr :kind, :atom, values: [:info, :error, :success, :warning], doc: "used for styling"

  slot :inner_block, required: true

  @doc """
  Generates a generic feedback message.

  Example:

      <.feedback kind={:info}>This is an info message.</.feedback>
  """
  def feedback(%{kind: :error} = assigns) do
    ~H"""
    <p class="flex gap-2 text-sm leading-6 text-red-600">
      <Heroicons.exclamation_circle class="h-6 w-6 flex-none" />
      <%= render_slot(@inner_block) %>
    </p>
    """
  end

  def feedback(%{kind: :info} = assigns) do
    ~H"""
    <p class="flex gap-2 text-sm leading-6 text-blue-600">
      <Heroicons.information_circle class="h-6 w-6 flex-none" />
      <%= render_slot(@inner_block) %>
    </p>
    """
  end

  def feedback(%{kind: :success} = assigns) do
    ~H"""
    <p class="flex gap-2 text-sm leading-6 text-green-600">
      <Heroicons.check_circle class="h-6 w-6 flex-none" />
      <%= render_slot(@inner_block) %>
    </p>
    """
  end

  def feedback(%{kind: :warning} = assigns) do
    ~H"""
    <p class="flex gap-2 text-sm leading-6 text-yellow-600">
      <Heroicons.exclamation_triangle class="h-6 w-6 flex-none" />
      <%= render_slot(@inner_block) %>
    </p>
    """
  end
end
