defmodule MbtaMetro.Utils do
  @moduledoc false

  @regex ~r/deps/

  def project_root do
    project_root(__DIR__)
  end

  defp project_root(directory) do
    IO.puts("Checking for root directory at #{directory}...")

    cond do
      String.match?(directory, @regex) ->
        directory
        |> Path.dirname()
        |> project_root()
      File.exists?(directory <> "/mix.exs") ->
        IO.puts("Root directory found...")

        directory
      true ->
        directory
        |> Path.dirname()
        |> project_root()
    end
  end
end
