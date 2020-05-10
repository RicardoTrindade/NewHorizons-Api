# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :newhorizonsapi,
  ecto_repos: [Newhorizonsapi.Repo]

# Configures the endpoint
config :newhorizonsapi, NewhorizonsapiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vh3dafXsHgE/X1aBHxjy6Qc4V10y9uHvlyufwkxvkAxvIlugrDhunfOq5K7GWwWd",
  render_errors: [view: NewhorizonsapiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Newhorizonsapi.PubSub,
  live_view: [signing_salt: "/aItA0cq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
