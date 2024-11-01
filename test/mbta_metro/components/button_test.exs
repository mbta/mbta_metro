defmodule MbtaMetro.Components.ButtonTest do
  @moduledoc false

  use ExUnit.Case

  import MbtaMetro.Components.Button, only: [button: 1]
  import MbtaMetro.Components.Icon, only: [icon: 1]
  import Phoenix.{Component, LiveViewTest}

  test "a button can be rendered" do
    assigns = %{}

    component =
      ~H"""
      <.button>Click me</.button>
      """

    assert rendered_to_string(component) =~ "Click me"
  end

  test "a button can be rendered with an icon" do
    assigns = %{}

    component =
      ~H"""
      <.button>
        <.icon type="brands" name="metro" class="h-10 w-10" />
        Click me
      </.button>
      """

    result = rendered_to_string(component)

    assert result =~ "svg"
    assert result =~ "Click me"
  end
end
