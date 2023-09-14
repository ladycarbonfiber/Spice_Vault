use graphviz_rust::dot_generator::*;
use graphviz_rust::dot_structures::*;
use graphviz_rust::{
    attributes::*,
    cmd::{CommandArg, Format},
    exec, parse,
    printer::{DotPrinter, PrinterContext},
};

#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}
#[rustler::nif]
fn render_svg() -> String {
    let  mut g = graph!(id!("id");
         node!("nod"),
         subgraph!("sb";
             edge!(node_id!("a") => subgraph!(;
                node!("n";
                NodeAttributes::color(color_name::black), NodeAttributes::shape(shape::egg))
            ))
        ),
        edge!(node_id!("a1") => node_id!(esc "a2"))
    );
    match(exec(
         g,
        &mut PrinterContext::default(),
        vec![Format::Svg.into()],
    )){
        Ok(s)=>s,
        Err(e)=>e.to_string(),
    }

}


rustler::init!("Elixir.PolyGraph", [add, render_svg]);
