defmodule TicketingSystem.Repo.Migrations.CreateTickets do
  use Ecto.Migration

  def change do
    create table(:tickets) do
      add :type, :string
      add :quantity, :integer
      add :status, :string
      add :user_id, :integer
      add :event_id, :integer
      timestamps()
    end

    create index(:tickets, [:user_id])
  end
end
