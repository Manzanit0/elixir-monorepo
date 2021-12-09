use Mix.Config

config :email_service, EmailService.Repo,
  hostname: "db",
  username: "docker",
  password: "123",
  database: "email_service_db"
