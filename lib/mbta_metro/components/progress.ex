defmodule MbtaMetro.Components.Progress do
  @moduledoc false

  use Phoenix.Component

  attr :aria_label, :string, required: true
  attr :value, :integer, default: 0

  @doc """
  Creates a progress bar.

  Example:

      <.progress aria_label="Downloading..." value={@download_percent} />
  """
  def progress(assigns) do
    ~H"""
    <progress aria-label={@aria_label} class="mbta-progress" max="100" value={@value}>
      {@value}
    </progress>
    """
  end
end
