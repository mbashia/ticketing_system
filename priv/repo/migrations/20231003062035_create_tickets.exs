defmodule TicketingSystem.Repo.Migrations.CreateTickets do
  use Ecto.Migration

  def change do
    create table(:tickets) do
      add :type, :string
      add :quantity, :integer
      add :status, :string

      timestamps()
    end
  end
end
