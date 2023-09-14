defmodule SpiceVaultWeb.WebController do
  use SpiceVaultWeb, :controller
  def index(conn, _params) do
    val = PolyGraph.add(1,2)
    graph = PolyGraph.render_svg()
    render(conn, "graph.html", test: val, graph: graph)

  end
end
