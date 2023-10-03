defmodule TicketingSystem.Tickets.Ticket do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tickets" do
    field :quantity, :integer
    field :status, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(ticket, attrs) do
    ticket
    |> cast(attrs, [:type, :quantity, :status])
    |> validate_required([:type, :quantity, :status])
  end
end
