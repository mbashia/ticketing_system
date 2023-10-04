defmodule TicketingSystemWeb.EventLive.Show do
  use TicketingSystemWeb, :live_view

  alias TicketingSystem.Events
  alias TicketingSystem.Tickets

  alias TicketingSystem.Tickets.Ticket
  @impl true
  def mount(_params, _session, socket) do
    changeset = Tickets.change_ticket(%Ticket{})

    {:ok,
     socket
     |> assign(:ticket_changeset, changeset)
   }
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:event, Events.get_event!(id))}
  end

  defp page_title(:show), do: "Show Event"
  defp page_title(:edit), do: "Edit Event"
  defp page_title(:getticket), do: "Get ticket"
end
