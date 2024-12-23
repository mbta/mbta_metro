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
    <progress
      aria-label={@aria_label}
      class="flex w-full h-1.5 border-1 rounded [&::-webkit-progress-bar]:rounded-lg [&::-webkit-progress-value]:rounded-lg [&::-webkit-progress-bar]:bg-charcoal-90 [&::-webkit-progress-value]:bg-cobalt-40 [&::-moz-progress-bar]:bg-cobalt-40"
      max="100"
      value={@value}
    >
      {@value}
    </progress>
    """
  end
end
