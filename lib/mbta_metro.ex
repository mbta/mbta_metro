defmodule MbtaMetro do
  @moduledoc """
  A Phoenix LiveView component library.
  """

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
