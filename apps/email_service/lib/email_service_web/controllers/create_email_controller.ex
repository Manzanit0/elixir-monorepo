defmodule EmailServiceWeb.CreateEmailController do
  use EmailServiceWeb, :controller
  alias EmailService.Emails

  def index(conn, params) do
    case Emails.get_email(params["id"]) do
      nil ->
        case Emails.create_email(params) do
          {:ok, email} ->
            Plug.Conn.send_resp(conn, :created, "")

          {:error, _err} ->
            conn
            |> Plug.Conn.put_status(:internal_server_error)
            |> json(%{error: "unable to process email"})
        end

      email ->
        params = Map.drop(params, ["id"])

        case Emails.update_email(email, params) do
          {:ok, _email} ->
            Plug.Conn.send_resp(conn, :no_content, "")

          {:error, _err} ->
            conn
            |> Plug.Conn.put_status(:internal_server_error)
            |> json(%{error: "unable to process email"})
        end
    end
  end
end
