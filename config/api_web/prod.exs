use Mix.Config

config :api_web, ApiWeb.Endpoint,
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

import_config "prod.secret.exs"
