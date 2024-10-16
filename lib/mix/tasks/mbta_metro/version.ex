defmodule Mix.Tasks.MbtaMetro.Version do
  @moduledoc "Update the version of MbtaMetro"
  @shortdoc "Updates MbtaMetro's version"

  use Mix.Task

  @impl Mix.Task
  def run([level]) do
    File.cd!("assets", fn ->
      run_command("npm version #{level}")

      run_command("npm publish") |> IO.puts()
    end)

    new_version_number = npm_version()

    File.open!("VERSION", [:write], fn file ->
      IO.write(file, new_version_number)
    end)

    run_command("git add VERSION")
    run_command("git commit -m 'Bump version to #{new_version_number}'") |> IO.puts()
  end

  defp npm_version do
    File.read!("assets/package.json")
    |> Jason.decode!()
    |> Map.get("version")
  end

  defp run_command(command) do
    command
  end
end
