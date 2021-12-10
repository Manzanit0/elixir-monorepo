defmodule AuthServiceWeb.LoginController do
  use AuthServiceWeb, :controller
  import Logger

  def login(conn, %{"email" => email}) do
    Logger.info("user with email #{email} logged in!")

    json(conn, %{success: true})
  end

  def login(conn, _params) do
    conn
    |> Plug.Conn.put_status(:bad_request)
    |> json(%{success: false})
  end
end
