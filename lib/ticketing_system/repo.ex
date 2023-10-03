defmodule TicketingSystem.Repo do
  use Ecto.Repo,
    otp_app: :ticketing_system,
    adapter: Ecto.Adapters.Postgres
end
