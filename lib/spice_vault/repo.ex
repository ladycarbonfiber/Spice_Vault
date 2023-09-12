defmodule SpiceVault.Repo do
  use Ecto.Repo,
    otp_app: :spice_vault,
    adapter: Ecto.Adapters.Postgres
end
