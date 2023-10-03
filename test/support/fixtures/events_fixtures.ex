defmodule TicketingSystem.EventsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TicketingSystem.Events` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        date: ~D[2023-10-02],
        description: "some description",
        name: "some name",
        status: "some status",
        time_ending: ~T[14:00:00],
        time_starting: ~T[14:00:00],
        venue: "some venue"
      })
      |> TicketingSystem.Events.create_event()

    event
  end
end
