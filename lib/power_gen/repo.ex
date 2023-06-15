defmodule PowerGen.Repo do
  use Ecto.Repo,
    otp_app: :power_gen,
    adapter: Ecto.Adapters.Postgres
end
