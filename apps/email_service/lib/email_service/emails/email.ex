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
  def changeset(egg, attrs) do
    egg
    |> cast(attrs, [:to, :from, :body, :id])
    |> validate_required([:to, :from, :body, :id])
  end
end
