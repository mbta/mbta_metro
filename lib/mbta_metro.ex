defmodule MbtaMetro do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      import MbtaMetro.Components.{
        Button,
        Core,
        Inputs
      }

      alias MbtaMetro.Live.{
        Map
      }
    end
  end
end
