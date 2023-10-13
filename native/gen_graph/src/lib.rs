

use layout::gv;
use layout::backends::svg::SVGWriter;
use gv::GraphBuilder;
#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}
#[rustler::nif]
fn render_svg() -> String {
    let contents = "digraph { a -> b [label=\"foo\"]; }";
    let mut parser = gv::DotParser::new(&contents);
    
    match parser.process() {
        Ok(g) => {
            let mut svg = SVGWriter::new();
            let mut gb = GraphBuilder::new();
            gb.visit_graph(&g);
            let mut vg = gb.get();
            vg.do_it(false, false, false, &mut svg);
            svg.finalize()

        },
        Err(err) => {
            err
        }
    }

}


rustler::init!("Elixir.PolyGraph", [add, render_svg]);
