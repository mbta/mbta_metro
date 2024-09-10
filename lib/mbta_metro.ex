defmodule MbtaMetro do
  @moduledoc """
  A Phoenix LiveView component library.
  """

  defmacro __using__(_) do
    quote do
      import MbtaMetro.Components.{
        Button,
        Inputs
      }

      alias MbtaMetro.Live.{
        Map
      }
    end
  end
end
