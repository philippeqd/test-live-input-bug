defmodule TestLiveInput.Repo do
  use Ecto.Repo,
    otp_app: :test_live_input,
    adapter: Ecto.Adapters.Postgres
end
