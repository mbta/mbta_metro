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
    <div
      class="mbta-metro-spinner h-8 w-8 after:border-4 before:border-4 after:border-solid before:border-solid after:border-cobalt-40 before:border-cobalt-70"
      role="status"
      aria-label={@aria_label}
    >
      <span class="sr-only"><%= @aria_label %></span>
    </div>
    """
  end
end
