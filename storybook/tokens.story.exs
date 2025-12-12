defmodule Storybook.Tokens do
  @moduledoc false

  import MbtaMetro.DocComponents

  use Phoenix.Component
  use PhoenixStorybook.Story, :page

  paths = Path.wildcard("assets/css/variables.*.css")

  for path <- paths do
    @external_resource path
  end

  @base File.read!("assets/css/variables.base.css")
  @light File.read!("assets/css/variables.light.css")
  @dark File.read!("assets/css/variables.dark.css")

  def doc, do: "Use with CSS properties, e.g. var(--token-name)"

  def navigation do
    [
      {:base, "Base"},
      {:system, "System"},
      {:light, "Semantic (Light)"},
      {:dark, "Semantic (Dark)"}
    ]
  end

  def render(%{tab: mode} = assigns) when mode in [:light, :dark] do
    ~H"""
    <.semantic mode={Atom.to_string(@tab)} />
    """
  end

  def render(%{tab: :base} = assigns) do
    assigns =
      assign_new(assigns, :tokens, fn ->
        load_tokens(@base)
        |> Enum.reject(fn [name, _] ->
          if String.contains?(name, "colors-black") || String.contains?(name, "colors-white") do
            false
          else
            # These will be rendered with the system colors
            String.contains?(name, "colors") and not String.contains?(name, "0")
          end
        end)
      end)

    ~H"""
    <h2>Base Tokens</h2>
    <.tokens_list tokens={@tokens} />
    """
  end

  def render(%{tab: :system} = assigns) do
    assigns =
      assign_new(assigns, :tokens, fn ->
        load_tokens(@base)
        |> Enum.filter(fn [name, _] -> String.contains?(name, "colors") end)
        |> Enum.reject(fn [name, _] -> String.contains?(name, "0") end)
        |> Enum.reject(fn [name, _] ->
          String.contains?(name, "colors-black") || String.contains?(name, "colors-white")
        end)
      end)

    ~H"""
    <h2>System Tokens</h2>
    <.tokens_list tokens={@tokens} />
    """
  end

  def render(assigns) do
    ~H"""
    <h2>More Tokens</h2>
    """
  end

  defp load_tokens(file) do
    file
    |> String.split("\n")
    |> Stream.map(&String.split(&1, ":"))
    |> Stream.filter(&(Enum.count(&1) == 2))
    |> Stream.reject(&Enum.any?(&1, fn x -> x == "" end))
    |> Stream.map(fn line ->
      Enum.map(line, &(String.trim(&1) |> String.trim_trailing(";")))
    end)
    |> Enum.to_list()
    |> Enum.sort_by(&List.first/1)
  end

  attr :mode, :string, values: ~w(light dark)

  defp semantic(assigns) do
    assigns =
      assign_new(assigns, :tokens, fn ->
        file =
          if assigns.mode == "dark" do
            @dark
          else
            @light
          end

        load_tokens(file)
      end)

    ~H"""
    <h2>Semantic Tokens ({String.capitalize(@mode)} Mode)</h2>
    <.tokens_list tokens={@tokens} />
    """
  end

  attr :tokens, :list, required: true

  defp tokens_list(assigns) do
    ~H"""
    <div
      :for={[token, value] <- @tokens}
      class="flex gap-lg w-full mb-1 items-center py-md border-b-xs border-cobalt-80"
    >
      <.preview token={token} value={value} />
      <.code>{token}</.code>
      <.code class="border-cobalt-90">{value}</.code>
    </div>
    """
  end

  defp preview(%{token: "--border-radius" <> _} = assigns) do
    ~H"""
    <div>
      <div class="bg-white border border-black size-36" style={"border-radius: #{@value};"} />
    </div>
    """
  end

  defp preview(%{token: "--border-width" <> _} = assigns) do
    ~H"""
    <div class="w-48">
      <hr class="border border-black" style={"border-width: #{@value};"} />
    </div>
    """
  end

  defp preview(%{token: "--font-family" <> _} = assigns) do
    ~H"""
    <div>
      <span style={"font-family: #{@value};"}>Metro</span>
    </div>
    """
  end

  defp preview(%{token: "--font-size" <> _} = assigns) do
    ~H"""
    <div>
      <span style={"font-size: #{@value};"}>Metro</span>
    </div>
    """
  end

  defp preview(%{token: "--line-height" <> _} = assigns) do
    ~H"""
    <div class="w-32 text-wrap break-all" style={"line-height: #{@value};"}>
      Abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
    </div>
    """
  end

  defp preview(%{token: "--minimum-tap" <> _} = assigns) do
    ~H"""
    <div>
      <div class="bg-black" style={"width: #{@value}; height: #{@value};"} />
    </div>
    """
  end

  defp preview(%{token: "--spacing" <> _} = assigns) do
    ~H"""
    <div class="flex" style={"gap: #{@value};"}>
      <div class="bg-black size-2" />
      <div class="bg-black size-2" />
    </div>
    """
  end

  defp preview(%{token: "--transition-duration"} = assigns) do
    ~H"""
    <div
      class="animate-bounce rounded-full bg-emerald-40 size-4 transition"
      style={"transition-duration: #{@value}"}
    />
    """
  end

  defp preview(assigns) do
    ~H"""
    <div class="size-10" style={"background-color: #{@value};"} />
    """
  end
end
