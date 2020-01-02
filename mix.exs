defmodule App.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.html": :test,
        "coveralls.json": :test,
      ],
      test_coverage: [
        tool: ExCoveralls
      ],
      dialyzer: [
        plt_add_deps: :transitive,
        ignore_warnings: "config/dialyzer_ignore.exs"
      ]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  defp deps do
    [
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.5.7", only: :test},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:distillery, "~> 2.1"}
    ]
  end

  defp aliases do
    [
      "app.setup.yarn": [&yarn_install/1],
      "app.setup": ["deps.get", "app.setup.yarn"]
    ]
  end

  defp yarn_install(_) do
    web_apps = ["core_web"]

    for app <- web_apps do
      Mix.shell.cmd("cd apps/#{app}/assets && yarn install")
    end
  end
end
