defmodule Storybook.Theme.Icons do
  @moduledoc false

  use PhoenixStorybook.Story, :example

  @variations [
    %{outline: true, stroke: "#7C878E"},
    %{solid: true, fill: "#7C878E"},
  ]

  @impl Phoenix.LiveView
  def mount(_, _, socket), do: {:ok, socket}

  @impl Phoenix.LiveView
  def render(assigns) do
    assigns = assign(assigns, :variations, @variations)

    ~H"""
    <div class="w-full flex flex-row">
      <div class="h-20 w-1/3 font-small flex flex-col justify-center items-center">
        Function
      </div>
      <%= for variation <- @variations do %>
        <div class={"h-20 w-1/3 font-small flex flex-col justify-center items-center"}>
          <%= Map.keys(variation) |> List.first() |> Atom.to_string() |> String.capitalize() %>
        </div>
      <% end %>
    </div>
    <hr />
    <div class="w-full flex flex-row flex-wrap">
      <%= for function <- icons() do %>
        <.icon function={function} variations={@variations} />
      <% end %>
    </div>
    """
  end

  def icon(assigns) do
    ~H"""
    <div class={"h-20 w-1/3 font-small flex flex-col justify-center"}>
      <%= "Heroicons.#{@function}/1" %>
    </div>
    <%= for variation <- @variations do %>
      <div class={"h-20 w-1/3 p-2 font-small flex flex-col justify-center items-center"}>
        <%= Phoenix.LiveView.TagEngine.component(Code.eval_string("&Heroicons.#{@function}/1") |> elem(0), variation, {__ENV__.module, __ENV__.function, __ENV__.file, __ENV__.line}) %>
      </div>
    <% end %>
    """
  end

  def icons do
    Heroicons.__info__(:functions)
    |> Enum.map(fn {name, _} -> Atom.to_string(name) end)
    |> Enum.reject(fn name ->
      String.first(name) == "_"
    end)
  end
end
