defmodule EmailService.Emails do
  import Ecto.Query, warn: false
  alias EmailService.Repo
  alias EmailService.Emails.Email

  def get_email(id) do
    Repo.get(Email, id)
  end

  def create_email(attrs \\ %{}) do
    %Email{}
    |> Email.changeset(attrs)
    |> Repo.insert()
  end

  def update_email(email, attrs) do
    email
    |> Email.update_changeset(attrs)
    |> Repo.update()
  end

  def list_emails do
    Repo.all(Email)
  end
end
