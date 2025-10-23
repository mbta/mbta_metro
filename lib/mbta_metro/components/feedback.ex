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
    <p class="mbta-feedback mbta-feedback--error">
      <.icon name="circle-exclamation" class="mbta-feedback-icon" />
      {render_slot(@inner_block)}
    </p>
    """
  end

  def feedback(%{kind: :info} = assigns) do
    ~H"""
    <p class="mbta-feedback mbta-feedback--info">
      <.icon name="circle-info" class="mbta-feedback-icon" />
      {render_slot(@inner_block)}
    </p>
    """
  end

  def feedback(%{kind: :success} = assigns) do
    ~H"""
    <p class="mbta-feedback mbta-feedback--success">
      <.icon name="circle-check" class="mbta-feedback-icon" />
      {render_slot(@inner_block)}
    </p>
    """
  end

  def feedback(%{kind: :warning} = assigns) do
    ~H"""
    <p class="mbta-feedback mbta-feedback--warning">
      <.icon name="triangle-exclamation" class="mbta-feedback-icon" />
      {render_slot(@inner_block)}
    </p>
    """
  end
end
