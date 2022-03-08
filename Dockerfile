FROM rust:1.31
COPY . .
RUN cargo build --release
CMD ["./target/release/cache-rpc --rpc-api-url https://bridgesplit.genesysgo.net/ -l 127.0.0.1:80 --config ../config.toml"]