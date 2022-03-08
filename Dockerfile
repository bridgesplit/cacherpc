FROM rust:1.31
COPY . .
RUN cargo build --release
CMD ["./cacherpc --rpc-api-url https://bridgesplit.genesysgo.net/ --log-file ./hello1 -l 127.0.0.1:80 --config ../config.toml"]