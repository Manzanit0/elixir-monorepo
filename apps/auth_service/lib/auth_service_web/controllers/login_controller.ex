defmodule AuthServiceWeb.LoginController do
  use AuthServiceWeb, :controller
  alias AuthService.EmailClient

  def login(conn, %{"email" => email}) do
    body = %{to: email, from: "no-reply@app.io", body: "Hey! You logged in!"}

    case EmailClient.send_email(body) do
      {:error, err} ->
        conn
        |> Plug.Conn.put_status(:internal_server_error)
        |> json(%{error: err})

      {:ok, %{status: status}} when status >= 200 and status <= 299 ->
        json(conn, %{success: true})

      {:ok, _} ->
        json(conn, %{error: "unable to send login email"})
    end
  end

  def login(conn, _params) do
    conn
    |> Plug.Conn.put_status(:bad_request)
    |> json(%{error: "no email"})
  end
end
