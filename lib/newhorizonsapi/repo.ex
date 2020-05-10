defmodule Newhorizonsapi.Repo do
  use Ecto.Repo,
    otp_app: :newhorizonsapi,
    adapter: Ecto.Adapters.Postgres
end
