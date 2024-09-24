defmodule MbtaMetro.Components.Spinner do
  @moduledoc false

  use Phoenix.Component

  attr :aria_label, :string, required: true
  attr :color, :string, default: "blue"

  @doc """
  Creates a spinner.

  Example:

      <.spinner aria_label="Loading..." color="silver"  />
  """
  def spinner(%{color: color} = assigns) do
    ~H"""
    <div
      class={"animate-spin inline-block size-6 border-[3px] border-current border-t-transparent text-#{color}-500 rounded-full"}
      role="status"
      aria-label={@aria_label}
    >
      <span class="sr-only"><%= @aria_label %></span>
    </div>
    """
  end
end
