# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cn,
  ecto_repos: [Cn.Repo]

# Configures the endpoint
config :cn, CnWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hJMhLrD1MdLzr2MFlXxzebswWcOS1T0uQqt77iII76uZBmb3ptoV+Ab3jdraAfyO",
  render_errors: [view: CnWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cn.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
