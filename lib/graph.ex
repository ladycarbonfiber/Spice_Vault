defmodule PolyGraph do
  use Rustler, otp_app: :spice_vault, crate: "gen_graph"

  # When your NIF is loaded, it will override this function.
  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
  def render_svg(), do: :erlang.nif_error(:nif_not_loaded)

end
