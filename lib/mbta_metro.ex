defmodule MbtaMetro do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      import MbtaMetro.Components.{
        Core,
        Button,
        Inputs
      }
    end
  end
end
