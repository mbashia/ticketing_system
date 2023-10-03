defmodule TicketingSystemWeb.PageController do
  use TicketingSystemWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
