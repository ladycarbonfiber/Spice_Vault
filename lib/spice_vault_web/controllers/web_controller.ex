defmodule SpiceVaultWeb.WebController do
  use SpiceVaultWeb, :controller

  def index(conn, _params) do
    render(conn, "graph.html")
  end
end
