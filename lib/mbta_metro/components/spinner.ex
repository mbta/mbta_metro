defmodule MbtaMetro.Components.Spinner do
  @moduledoc false

  use Phoenix.Component

  attr :aria_label, :string, required: true

  @doc """
  Creates a spinner.

  Example:

      <.spinner aria_label="Loading..." />
  """
  def spinner(assigns) do
    ~H"""
    <div class="mbta-spinner" role="status" aria-label={@aria_label}>
      <span class="sr-only">{@aria_label}</span>
    </div>
    """
  end
end
