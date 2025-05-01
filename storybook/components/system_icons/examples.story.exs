defmodule MbtaMetroWeb.Storybook.SystemIcons.Examples do
  use PhoenixStorybook.Story, :example

  import MbtaMetro.Components.SystemIcons

  def doc, do: "Using mode & route icons."

  @impl Phoenix.LiveView
  def mount(_, _, socket), do: {:ok, socket}

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <.h2>Mode Icons</.h2>
    <p><.mode_icon mode="commuter-rail" /> {Faker.Lorem.paragraph()}</p>
    <p class="text-sm">
      <.mode_icon mode="bus" size="small" /> <.mode_icon mode="subway" size="small" />
      <.mode_icon mode="ferry" size="small" /> {Faker.Lorem.paragraph()}
    </p>

    <.h2>Route Icons</.h2>
    <div>
      <.route_icon line="red-line" /> <strong class="font-helvetica">Red Line</strong>
    </div>
    <div>
      <.route_icon line="mattapan-line" /> <strong class="font-helvetica">Mattapan Line</strong>
    </div>
    <div>
      <.route_icon name="CT3" />
      <strong class="font-helvetica">Beth Israel Deaconess Hospital - Andrew Station</strong>
    </div>
    <div>
      <p class="my-lg">
        Connections:
        <.route_icon :for={name <- ~w(1 30 555 CT2 SL1 SL4)} name={name} size="small" class="ml-xs" />
      </p>
      <p class="my-lg">
        Connections: <.route_icon :for={name <- ~w(1 30 555 CT2 SL1 SL4)} name={name} class="ml-xs" />
      </p>
      <div class="my-lg bg-charcoal-80 p-md">
        <div class="text-lg font-bold mb-xs">Super Station</div>
        <div>
          Routes: <.route_icon line="green-line-b" size="small" />
          <.route_icon line="green-line-c" size="small" />
          <.route_icon line="green-line-d" size="small" />
          <.route_icon name="SL6" size="small" />
          <.route_icon name="SL7" size="small" />
          <.route_icon name="SL8" size="small" />
          <.route_icon name="99" size="small" />
        </div>
      </div>
    </div>
    """
  end

  defp h2(assigns) do
    ~H"""
    <h2 class="font-heading font-bold text-lg mt-lg mb-sm">
      {render_slot(@inner_block)}
    </h2>
    """
  end
end
