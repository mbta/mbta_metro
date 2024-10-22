defmodule MbtaMetro.Utils do
  @moduledoc false

  def project_root do
    project_root(__DIR__)
  end

  defp project_root(directory) do
    IO.puts("Checking for root directory at #{directory}...")

    case File.read("#{directory}/mix.exs") do
      {:ok, _} ->
        IO.puts("Root directory found...")

        directory
      _ ->
        directory
        |> Path.dirname()
        |> project_root()
    end
  end
end
