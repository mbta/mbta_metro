defmodule MbtaMetro.Components.IconTest do

  use ExUnit.Case

  alias MbtaMetro.Components.Icon

  test "icons are available" do
    assert Kernel.length(Icon.icons()) > 0
  end
end
