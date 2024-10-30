defmodule MbtaMetro.Components.Progress do
  @moduledoc false

  use Phoenix.Component

  attr :aria_label, :string, required: true
  attr :color, :string, default: "blue"
  attr :value, :integer, default: 0

  @doc """
  Creates a progress bar.

  Example:

      <.progress aria_label="Downloading..." color="silver"  value={@download_percent} />
  """
  def progress(assigns) do
    ~H"""
    <div
      class={"bg-#{@color}-100 flex w-full h-1.5 rounded-full overflow-hidden border-1"}
      role="progressbar"
      aria-label={@aria_label}
      aria-valuenow={@value}
      aria-valuemin="0"
      aria-valuemax="100"
    >
      <div
        class={"bg-#{@color}-500 flex flex-col justify-center rounded-full overflow-hidden text-xs text-white text-center whitespace-nowrap transition duration-500"}
        style={"width: #{@value}%"}
      >
      </div>
    </div>
    """
  end
end
