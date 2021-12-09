import Config

config :auth_service, AuthService.Repo,
  hostname: "db",
  username: "docker",
  password: "123",
  database: "auth_service_db"
