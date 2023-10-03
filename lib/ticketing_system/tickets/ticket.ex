defmodule TicketingSystem.Tickets.Ticket do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicketingSystem.Accounts.User

  schema "tickets" do
    field :quantity, :integer
    field :status, :string
    field :type, :string
    belongs_to :user, User, foreign_key: :user_id
    timestamps()
  end

  @doc false
  def changeset(ticket, attrs) do
    ticket
    |> cast(attrs, [:type, :quantity, :status, :user_id])
    |> validate_required([:type, :quantity, :status, :user_id])
  end
end
