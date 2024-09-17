defmodule MbtaMetro do
  @moduledoc """
  A Phoenix LiveView component library.
  """

  defmacro __using__(_) do
    quote do
      import MbtaMetro.Components.{
        Accordion,
        Button,
        Inputs,
        ModeSelector
      }
    end
  end
end
