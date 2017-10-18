extern crate clap;

use clap::Shell;

include!("src/cli.rs");

fn main() {
    let mut app = build_cli();
    let out_dir = std::env::var("OUT_DIR").unwrap();
    app.gen_completions("rust-travis-eureka", Shell::Bash, &out_dir);
    app.gen_completions("rust-travis-eureka", Shell::Fish, &out_dir);
    app.gen_completions("rust-travis-eureka", Shell::Zsh,  &out_dir);
}
