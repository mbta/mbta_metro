defmodule MbtaMetro.Components.SpinnerTest do
  @moduledoc false

  use ExUnit.Case

  import MbtaMetro.Components.Spinner, only: [spinner: 1]
  import Phoenix.{Component, LiveViewTest}

  test "a spinner can be rendered with defaults" do
    assigns = %{}

    component =
      ~H"""
      <.spinner aria_label="Loading..." />
      """

    assert rendered_to_string(component) =~ "aria-label=\"Loading...\""
  end
end
