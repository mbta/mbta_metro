defmodule MbtaMetro do
  @moduledoc """
  A Phoenix LiveView component library.
  """

  defmacro __using__(_) do
    quote do
      import MbtaMetro.Components.{
        Accordion,
        Badge,
        Button,
        DataList,
        Feedback,
        Flash,
        Icon,
        Input,
        InputGroup,
        Modal,
        Progress,
        Spinner,
        Table
      }
    end
  end
end
