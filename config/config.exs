# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ember_phoenix_scaffold,
  ecto_repos: [EmberPhoenixScaffold.Repo]

# Configures the endpoint
config :ember_phoenix_scaffold, EmberPhoenixScaffold.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QCrS6X5IU0DY1vYZi60HX/SdzwJklJ70lULjOB9CWbQzHeaL3cNklvD7QLziWqot",
  render_errors: [view: EmberPhoenixScaffold.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EmberPhoenixScaffold.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
