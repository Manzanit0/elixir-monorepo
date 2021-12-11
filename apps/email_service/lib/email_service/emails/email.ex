defmodule EmailService.Emails.Email do
  use Ecto.Schema
  import Ecto.Changeset

  schema "emails" do
    field(:to, :string)
    field(:from, :string)
    field(:body, :string)

    timestamps()
  end

  @doc false
  def changeset(email, attrs) do
    email
    |> cast(attrs, [:to, :from, :body, :id])
    |> validate_required([:to, :from, :body, :id])
    |> unique_constraint([:id], name: :emails_pkey)
  end

  def update_changeset(email, attrs) do
    email
    |> cast(attrs, [:to, :from, :body])
  end
end
