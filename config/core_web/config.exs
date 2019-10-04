use Mix.Config

config :core_web,
       ecto_repos: [Core.Repo],
       generators: [context_app: :core]

# Configures the endpoint
config :core_web, CoreWeb.Endpoint,
       url: [host: "localhost"],
       secret_key_base: "/YcyOBLUKdVoQOBxKMG5rMPU89E27RzvsSEIx20VQ62GjE/r2iEWvqFyMbhy43tZ",
       render_errors: [view: CoreWeb.ErrorView, accepts: ~w(html json)],
       pubsub: [name: CoreWeb.PubSub, adapter: Phoenix.PubSub.PG2]

import_config "#{Mix.env()}.exs"

if File.regular?("#{Path.dirname(__ENV__.file)}/#{Mix.env()}.local.exs") do
  import_config("#{Mix.env()}.local.exs")
end
