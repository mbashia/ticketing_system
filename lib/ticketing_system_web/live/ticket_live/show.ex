defmodule TicketingSystemWeb.TicketLive.Show do
  use TicketingSystemWeb, :live_view

  alias TicketingSystem.Tickets

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, url, socket) do
    IO.inspect(url)
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:ticket, Tickets.get_ticket!(id))
    |>assign(:ticket_url, url)}
  end

  defp page_title(:show), do: "Show Ticket"
  defp page_title(:edit), do: "Edit Ticket"
end
