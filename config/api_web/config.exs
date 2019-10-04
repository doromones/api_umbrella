use Mix.Config

config :api_web,
       ecto_repos: [Core.Repo],
       generators: [context_app: :core]

# Configures the endpoint
config :api_web, ApiWeb.Endpoint,
       url: [host: "localhost"],
       secret_key_base: "vjlv1WS6LKbgo63hNg7pLa97tRhFou6RWt98q6p8W6RFDm1uMzOQj4NyVRLMszuY",
       render_errors: [view: ApiWeb.ErrorView, accepts: ~w(json)],
       pubsub: [name: ApiWeb.PubSub, adapter: Phoenix.PubSub.PG2]

config :api_web, ApiWeb.Guardian,
       issuer: :api_web,
       secret_key: "Sb0zJMY8lxOD299doNrSMplgr9sFMSV8ca5davfIGjl4FYleaNzFawoEuykFNkKT"


import_config "#{Mix.env()}.exs"

if File.regular?("#{Path.dirname(__ENV__.file)}/#{Mix.env()}.local.exs") do
  import_config("#{Mix.env()}.local.exs")
end
