defmodule Cn.Repo do
  use Ecto.Repo,
    otp_app: :cn,
    adapter: Ecto.Adapters.Postgres
end
