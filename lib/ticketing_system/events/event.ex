defmodule TicketingSystem.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias TicketingSystem.Accounts.User

  schema "events" do
    field :date, :date
    field :description, :string
    field :name, :string
    field :status, :string
    field :time_ending, :time
    field :time_starting, :time
    field :venue, :string
    belongs_to :user, User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [
      :name,
      :venue,
      :description,
      :date,
      :status,
      :time_starting,
      :time_ending,
      :user_id
    ])
    |> validate_required([
      :name,
      :venue,
      :description,
      :date,
      :status,
      :time_starting,
      :time_ending,
      :user_id
    ])
  end
end
