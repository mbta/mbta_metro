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
      <.icon type="brands" name="metro" class="h-10 w-10" aria-hidden />
      """

    result = rendered_to_string(component)

    assert result =~ "svg"
    assert result =~ ~s(class="h-10 w-10")
    assert result =~ ~s(aria-hidden="true")
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
