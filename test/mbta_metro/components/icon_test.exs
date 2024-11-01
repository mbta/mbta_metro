defmodule MbtaMetro.Components.IconTest do
  @moduledoc false

  use ExUnit.Case

  import MbtaMetro.Components.Icon, only: [icon: 1, icons: 0]
  import Phoenix.{Component, LiveViewTest}

  test "icons are available" do
    assert Kernel.length(icons()) > 0
  end

  test "an icon can be rendered" do
    assigns = %{}

    component =
      ~H"""
      <.icon type="brands" name="metro" class="h-10 w-10" />
      """

    result = rendered_to_string(component)

    assert result =~ "svg"
    assert result =~ "h-10 w-10"
  end

  test "the class attribute is optional" do
    assigns = %{}

    component =
      ~H"""
      <.icon type="brands" name="metro" />
      """

    assert rendered_to_string(component) =~ "svg"
  end
end
