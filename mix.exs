defmodule Re.Mixfile do
  use Mix.Project

  def project do
    [app: :re,
     version: "0.0.1",
     elixir: "~> 1.5",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Re.Application, []},
     applications: [:phoenix, :phoenix_pubsub, :cowboy, :logger, :gettext,
                    :phoenix_ecto, :postgrex, :comeonin, :swoosh,
                    :scrivener_ecto, :cloudex]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.3.0"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.0"},
     {:postgrex, ">= 0.0.0"},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:cors_plug, "~> 1.2"},
     {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
     {:comeonin, "~> 3.2"},
     {:guardian, "~> 0.14.5"},
     {:ex_machina, "~> 2.0", only: :test},
     {:swoosh, "~> 0.12.0"},
     {:scrivener_ecto, "~> 1.0"},
     {:cloudex, "~> 1.0.0"},
   ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
