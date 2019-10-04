use Mix.Config

config :core_web,
       CoreWeb.Endpoint,
       http: [
         port: 4000
       ],
       debug_errors: true,
       code_reloader: true,
       check_origin: false,
       watchers: [
         npm: [
           "run",
           "watch",
           cd: Path.expand("#{File.cwd!}/apps/core_web/assets", __DIR__)
         ]
       ]

config :core_web,
       CoreWeb.Endpoint,
       live_reload: [
         patterns: [
           ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
           ~r"priv/gettext/.*(po)$",
           ~r"lib/core_web/{live,views}/.*(ex)$",
           ~r"lib/core_web/templates/.*(eex)$"
         ]
       ]
