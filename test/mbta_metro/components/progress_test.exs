defmodule MbtaMetro.Components.ProgressTest do
  @moduledoc false

  use ExUnit.Case

  import MbtaMetro.Components.Progress, only: [progress: 1]
  import Phoenix.{Component, LiveViewTest}

  test "an progress bar can be rendered with defaults" do
    assigns = %{}

    component =
      ~H"""
      <.progress aria_label="Downloading..." />
      """

    result = rendered_to_string(component)

    assert result =~ "aria-label=\"Downloading...\""
    assert result =~ "value=\"0\""
  end

  test "an progress bar can be rendered with a value" do
    assigns = %{}

    component =
      ~H"""
      <.progress aria_label="Downloading..." value={50} />
      """

    result = rendered_to_string(component)

    assert result =~ "value=\"50\""
  end
end
