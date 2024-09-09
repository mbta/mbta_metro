defmodule MbtaMetro do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      import MbtaMetro.Components.{
        Button,
        Core,
        Inputs
      }
    end
  end
end
