defmodule MbtaMetro.Components.Swatch do
  @moduledoc false

  use Phoenix.Component

  attr :color, :string, required: true

  def swatch(assigns) do
    ~H"""
    <div class="h-10 w-full flex flex-row">
      <%= for n <- 1..9 do %>
        <div class={[
          "h-10 w-[10%] font-small flex flex-col justify-center items-center bg-#{assigns[:color]}-#{n * 10}",
          if(n > 5, do: "text-black", else: "text-white"),
          n == 5 && "border border-2 border-white outline outline-2 outline-black z-50"
        ]}>
          {n * 10}
        </div>
      <% end %>
    </div>
    """
  end
end
