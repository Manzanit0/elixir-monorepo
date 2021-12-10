defmodule EmailService.Emails do
  import Ecto.Query, warn: false
  alias EmailService.Repo
  alias EmailService.Emails.Email

  def create_email(attrs \\ %{}) do
    %Email{}
    |> Email.changeset(attrs)
    |> Repo.insert()
  end

  def list_emails do
    Repo.all(Email)
  end
end
