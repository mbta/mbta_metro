defmodule MbtaMetro do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      import MbtaMetro.Components.{
        Button
      }
    end
  end
end
