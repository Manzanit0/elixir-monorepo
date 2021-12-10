defmodule EmailService.Repo.Migrations.AddEmailsTable do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add(:to, :string)
      add(:from, :string)
      add(:body, :string)

      timestamps()
    end
  end
end
