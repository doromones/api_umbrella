use Mix.Config

config :core, Core.Repo,
       username: "postgres",
       password: "postgres",
       database: "core_test",
       hostname: System.get_env("POSTGRES_HOST", "localhost"),
       port: System.get_env("POSTGRES_PORT", "5432"),
       pool: Ecto.Adapters.SQL.Sandbox
