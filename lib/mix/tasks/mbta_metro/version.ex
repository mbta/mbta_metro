defmodule Mix.Tasks.MbtaMetro.Version do
  @moduledoc "Update the version of MbtaMetro"
  @shortdoc "Updates MbtaMetro's version"

  use Mix.Task

  @impl Mix.Task
  def run([level]) do
    hex_version = hex_version()
    levels = String.split(hex_version, ".", parts: 3)
    new_version = "#{new_hex_version(levels, level)}-#{npm_version()}"

    File.open!("VERSIONS", [:write, :append], fn file ->
      IO.write(file, "\n#{new_version}\n")
    end)
  end

  defp bump_version(version) do
    version
    |> String.to_integer()
    |> Kernel.+(1)
    |> Integer.to_string()
  end

  defp hex_version do
    File.read!("VERSIONS")
    |> String.split("\n", trim: true)
    |> List.last()
    |> String.split("-")
    |> List.first()
  end

  defp new_hex_version(levels, "major") do
    "#{bump_version(Enum.at(levels, 0))}.#{Enum.at(levels, 1)}.#{Enum.at(levels, 2)}"
  end

  defp new_hex_version(levels, "minor") do
    "#{Enum.at(levels, 0)}.#{bump_version(Enum.at(levels, 1))}.#{Enum.at(levels, 2)}"
  end

  defp new_hex_version(levels, "patch") do
    "#{Enum.at(levels, 0)}.#{Enum.at(levels, 1)}.#{bump_version(Enum.at(levels, 2))}"
  end

  defp npm_version do
    File.read!("assets/package.json")
    |> Jason.decode!()
    |> Map.get("version")
  end
end
