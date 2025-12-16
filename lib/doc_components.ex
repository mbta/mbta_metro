defmodule MbtaMetro.DocComponents do
  @moduledoc false

  use Phoenix.Component

  attr :class, :string, default: ""
  slot :inner_block, required: true

  def code(assigns) do
    ~H"""
    <code class={"border border-cobalt-70 text-cobalt-20 bg-cobalt-90 inline-block px-xs py-05 rounded #{@class}"}>
      {render_slot(@inner_block)}
    </code>
    """
  end

  attr :tokens, :list, required: true

  def tokens_list(assigns) do
    ~H"""
    <div
      :for={[token, value] <- @tokens}
      class="flex gap-lg w-full mb-1 items-center py-sm border-b-xs border-cobalt-80"
    >
      <.preview token={token} value={value} />
      <.code>{token}</.code>
      <.code class="border-none bg-white text-gold-20">{value}</.code>
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
    <div class="size-6" style={"background-color: #{@value};"} />
    """
  end
end
