defmodule TicketingSystem.Tickets.Ticket do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicketingSystem.Accounts.User
  alias TicketingSystem.Events.Event

  schema "tickets" do
    field :quantity, :integer
    field :status, :string
    field :type, :string
    belongs_to :user, User, foreign_key: :user_id
    belongs_to :event, Event
    timestamps()
  end

  @doc false
  def changeset(ticket, attrs) do
    ticket
    |> cast(attrs, [:type, :quantity, :status, :user_id, :event_id])
    |> validate_required([:type, :quantity, :status, :user_id, :event_id])
  end
end
