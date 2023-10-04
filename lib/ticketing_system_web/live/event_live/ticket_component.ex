defmodule TicketingSystemWeb.EventLive.TicketComponent do
  use TicketingSystemWeb, :live_component
  alias TicketingSystem.Tickets

  def render(assigns) do
    IO.inspect(assigns)
    ~H"""
    <div>

    this is where you will get you ticket from
    <.form
    let={f}
    for={@changeset}
    id="ticket-form"
    phx-target={@myself}
    phx-submit="save">


    <%= label f, :quantity %>
    <%= number_input f, :quantity %>
    <%= error_tag f, :quantity %>



    <div>
      <%= submit "Save", phx_disable_with: "Saving..." %>
    </div>
    </.form>
    <p>
    <%= @ticket_message%>
    </p>

    </div>
    """
  end

  def handle_event("save", %{"ticket" => %{"quantity" => quantity}}, socket) do
    ticket_params = %{
      "quantity" => quantity,
      "status" => "not scanned",
      "type" => "early bird",
      "user_id" => 0,
      "event_id" => socket.assigns.event.id
    }

    case Tickets.create_ticket(ticket_params) do
      {:ok, _ticket} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ticket created successfully")
        |>assign(:ticket_message, "visit  here to get you ticket")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
