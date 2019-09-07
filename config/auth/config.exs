use Mix.Config

config :auth,
       ecto_repos: [Auth.Repo]

# Configures the endpoint
config :auth, AuthWeb.Endpoint,
       url: [host: "localhost"],
       secret_key_base: "HmqcRiObGT4xIis4MghaTVH7DjoTEKHXYKdI2UEoVF2wDlBQ7YcWQWoNTRdJbgsD",
       render_errors: [view: AuthWeb.ErrorView, accepts: ~w(html json)],
       pubsub: [name: Auth.PubSub, adapter: Phoenix.PubSub.PG2]

import_config "#{Mix.env()}.exs"

if File.regular?("#{Path.dirname(__ENV__.file)}/#{Mix.env()}.local.exs") do
  import_config("#{Mix.env()}.local.exs")
end
