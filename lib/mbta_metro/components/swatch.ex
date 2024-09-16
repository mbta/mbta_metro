defmodule MbtaMetro.Components.Swatch do
  @moduledoc false

  use Phoenix.Component

  attr :name, :string, required: true

  def swatch(assigns) do
    ~H"""
    <div class="h-10 w-100 grid grid-cols-9 gap-9">
      <%= for n <- 1..9 do %>
        <div class={"h-10 w-10 font-small flex flex-col justify-center items-center text-white bg-#{assigns[:name]}-#{n * 100}"}>
          <%= n * 100 %>
        </div>
      <% end %>
    </div>
    """
  end
end
