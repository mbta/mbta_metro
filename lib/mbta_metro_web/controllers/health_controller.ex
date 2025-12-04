defmodule MbtaMetroWeb.HealthController do
  @moduledoc false
  use MbtaMetroWeb, :controller

  def index(conn, _params) do
    conn |> send_resp(200, "")
  end
end
