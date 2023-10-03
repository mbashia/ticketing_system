defmodule TicketingSystem.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :venue, :string
      add :description, :string
      add :date, :date
      add :status, :string
      add :time_starting, :time
      add :time_ending, :time

      timestamps()
    end
  end
end
