use Mix.Config

config :core,
       ecto_repos: [Core.Repo]

import_config "#{Mix.env()}.exs"

if File.regular?("#{Path.dirname(__ENV__.file)}/#{Mix.env()}.local.exs") do
  import_config("#{Mix.env()}.local.exs")
end
