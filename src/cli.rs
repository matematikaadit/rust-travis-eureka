use clap::App;

pub fn build_cli() -> App<'static, 'static> {
    App::new("rust-travis-eureka")
        .version("0.4.0")
        .about(r#"Print "Eureka!""#)
        .author("Adit Cahya Ramadhan")
}
