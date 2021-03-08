# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :test_live_input,
  ecto_repos: [TestLiveInput.Repo]

# Configures the endpoint
config :test_live_input, TestLiveInputWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qVkcIiMwDQoY9lVXwUHK7z+J1BZuekC3dodx5QWCq1TxW+binh84IekqHt4+WhEK",
  render_errors: [view: TestLiveInputWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TestLiveInput.PubSub,
  live_view: [signing_salt: "6q4Nl47Z"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
