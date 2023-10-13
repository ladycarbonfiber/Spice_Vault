defmodule SpiceVaultWeb.WebController do
  use SpiceVaultWeb, :controller
  def index(conn, _params) do
    val = PolyGraph.add(1,2)
    graph = PolyGraph.render_svg()
    testsvg =
      """
      <?xml version="1.0" encoding="UTF-8"?>
      <svg xmlns="http://www.w3.org/2000/svg" width="96" height="214" viewBox="0 0 96 214">
      <defs>
        <marker id="startarrow" markerWidth="10" markerHeight="7" refX="0" refY="3.5" orient="auto">
          <path d="M10 0v7L0 3.5z"/>
        </marker>
        <marker id="endarrow" markerWidth="10" markerHeight="7" refX="10" refY="3.5" orient="auto">
          <path d="m0 0 10 3.5L0 7z"/>
        </marker>
      </defs>
      <style>
        .a14{font-size:14px;font-family:Times,serif}
      </style>
      <circle cx="57" cy="47" fill="#ffffffff" stroke="#000000ff" r="17"/>
      <text text-anchor="middle" x="57" y="33" class="a14">
        <tspan x="57" dy="1em">a</tspan>
      </text>
      <circle cx="57" cy="175" fill="#ffffffff" stroke="#000000ff" r="17"/>
      <text text-anchor="middle" x="57" y="161" class="a14">
        <tspan x="57" dy="1em">b</tspan>
      </text>
      <text text-anchor="middle" x="31" y="97" class="a14">
        <tspan x="31" dy="1em">foo</tspan>
      </text>
      <path id="arrow0" d="M57 64v94" stroke="#000000ff" stroke-width="1" marker-end="url(#endarrow)" fill="transparent"/>
      <text>
        <textPath href="#arrow0" text-anchor="middle" class="a14"/>

      </text>
      </svg>
      """
    render(conn, "graph.html", test: val, graph: graph, testsvg: testsvg)

  end
end
