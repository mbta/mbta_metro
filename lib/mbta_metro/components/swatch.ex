defmodule MbtaMetro.Components.Swatch do
  @moduledoc false

  use Phoenix.Component

  attr :color, :string, required: true

  def swatch(assigns) do
    ~H"""
    <div class="h-10 w-full flex flex-row">
      <%= for n <- 1..9 do %>
        <div class={"h-10 w-[11.11%] font-small flex flex-col justify-center items-center text-white bg-#{assigns[:color]}-#{n * 100}"}>
          <%= n * 100 %>
        </div>
      <% end %>
    </div>
    """
  end
end
