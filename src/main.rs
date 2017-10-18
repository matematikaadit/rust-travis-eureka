extern crate clap;
mod cli;

fn main() {
    cli::build_cli().get_matches();
    println!("Eureka!");
}
