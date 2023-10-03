defmodule TicketingSystem.EventsTest do
  use TicketingSystem.DataCase

  alias TicketingSystem.Events

  describe "events" do
    alias TicketingSystem.Events.Event

    import TicketingSystem.EventsFixtures

    @invalid_attrs %{
      date: nil,
      description: nil,
      name: nil,
      status: nil,
      time_ending: nil,
      time_starting: nil,
      venue: nil
    }

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{
        date: ~D[2023-10-02],
        description: "some description",
        name: "some name",
        status: "some status",
        time_ending: ~T[14:00:00],
        time_starting: ~T[14:00:00],
        venue: "some venue"
      }

      assert {:ok, %Event{} = event} = Events.create_event(valid_attrs)
      assert event.date == ~D[2023-10-02]
      assert event.description == "some description"
      assert event.name == "some name"
      assert event.status == "some status"
      assert event.time_ending == ~T[14:00:00]
      assert event.time_starting == ~T[14:00:00]
      assert event.venue == "some venue"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()

      update_attrs = %{
        date: ~D[2023-10-03],
        description: "some updated description",
        name: "some updated name",
        status: "some updated status",
        time_ending: ~T[15:01:01],
        time_starting: ~T[15:01:01],
        venue: "some updated venue"
      }

      assert {:ok, %Event{} = event} = Events.update_event(event, update_attrs)
      assert event.date == ~D[2023-10-03]
      assert event.description == "some updated description"
      assert event.name == "some updated name"
      assert event.status == "some updated status"
      assert event.time_ending == ~T[15:01:01]
      assert event.time_starting == ~T[15:01:01]
      assert event.venue == "some updated venue"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
