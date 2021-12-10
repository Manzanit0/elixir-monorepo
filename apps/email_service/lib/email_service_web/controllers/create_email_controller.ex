defmodule EmailServiceWeb.CreateEmailController do
  use EmailServiceWeb, :controller
  import Logger
  alias EmailService.Emails

  def index(conn, params) do
    with {:ok, email} <- Emails.create_email(params) do
      conn
      |> Plug.Conn.put_status(:created)
      |> json(%{success: true})
    else
      {:error, _err} ->
        conn
        |> Plug.Conn.put_status(:internal_server_error)
        |> json(%{error: "unable to process email"})
    end
  end
end
