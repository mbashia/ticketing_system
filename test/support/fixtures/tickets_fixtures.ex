defmodule TicketingSystem.TicketsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TicketingSystem.Tickets` context.
  """

  @doc """
  Generate a ticket.
  """
  def ticket_fixture(attrs \\ %{}) do
    {:ok, ticket} =
      attrs
      |> Enum.into(%{
        quantity: 42,
        status: "some status",
        type: "some type"
      })
      |> TicketingSystem.Tickets.create_ticket()

    ticket
  end
end
