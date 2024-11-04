defmodule Mix.Tasks.MbtaMetro.Version do
  @moduledoc "Update the version of MbtaMetro"
  @shortdoc "Updates MbtaMetro's version"

  use Mix.Task

  @impl Mix.Task
  def run([level]) do
    new_version_number =
      File.read!("VERSION")
      |> String.trim()
      |> String.split(".")
      |> Enum.map(&String.to_integer/1)
      |> bump_hex_version(level)

    File.open!("VERSION", [:write], fn file ->
      IO.write(file, new_version_number)
    end)

    run_command("git add VERSION") |> IO.puts()
    run_command("git commit -m 'Bump version to #{new_version_number}'") |> IO.puts()
  end

  defp bump_hex_version([major, minor, patch], "patch") do
    "#{major}.#{minor}.#{patch + 1}"
  end

  defp bump_hex_version([major, minor, _patch], "minor") do
    "#{major}.#{minor + 1}.0"
  end

  defp bump_hex_version([major, _minor, _patch], "major") do
    "#{major + 1}.0.0"
  end

  defp run_command(command) do
    command
    |> Kernel.to_charlist()
    |> :os.cmd()
  end
end
