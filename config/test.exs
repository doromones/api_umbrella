use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api_web, ApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Configure your database
config :core, Core.Repo,
  username: "postgres",
  password: "postgres",
  database: "core_test",
  hostname: System.get_env("POSTGRES_HOST", "localhost"),
  port: System.get_env("POSTGRES_PORT", "5432"),
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :core_web, CoreWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
