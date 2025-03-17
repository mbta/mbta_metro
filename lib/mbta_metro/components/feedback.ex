defmodule MbtaMetro.Components.Feedback do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Icon, only: [icon: 1]

  attr :kind, :atom, values: [:info, :error, :success, :warning], doc: "used for styling"

  slot :inner_block, required: true

  @doc """
  Generates a generic feedback message.

  Example:

      <.feedback kind={:info}>This is an info message.</.feedback>
  """
  def feedback(%{kind: :error} = assigns) do
    ~H"""
    <p class="flex items-center gap-2 text-sm leading-6 text-firebrick-30 my-2">
      <.icon name="circle-exclamation" class="h-5 w-5 mt-0.5 fill-firebrick-30" />
      {render_slot(@inner_block)}
    </p>
    """
  end

  def feedback(%{kind: :info} = assigns) do
    ~H"""
    <p class="flex items-center gap-2 text-sm leading-6 text-cobalt-30 my-2">
      <.icon name="circle-info" class="h-5 w-5 mt-0.5 fill-cobalt-30" />
      {render_slot(@inner_block)}
    </p>
    """
  end

  def feedback(%{kind: :success} = assigns) do
    ~H"""
    <p class="flex items-center gap-2 text-sm leading-6 text-emerald-30 my-2">
      <.icon name="circle-check" class="h-5 w-5 mt-0.5 fill-emerald-30" />
      {render_slot(@inner_block)}
    </p>
    """
  end

  def feedback(%{kind: :warning} = assigns) do
    ~H"""
    <p class="flex items-center gap-2 text-sm leading-6 text-gold-30 my-2">
      <.icon name="triangle-exclamation" class="h-5 w-5 mt-0.5 fill-gold-30" />
      {render_slot(@inner_block)}
    </p>
    """
  end
end
