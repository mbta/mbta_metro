defmodule MbtaMetro.Utils do
  @moduledoc false

  def project_root do
    project_root(__DIR__)
  end

  defp project_root(directory) do
    IO.puts("Checking for root directory at #{directory}...")

    if File.exists?(directory <> "/mix.exs") do
      IO.puts("Root directory found...")

      directory
    else
      directory
      |> Path.dirname()
      |> project_root()
    end
  end
end
