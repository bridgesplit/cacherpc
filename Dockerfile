FROM rust:1.31
WORKDIR /build
COPY . /build
RUN cargo build --release
CMD /build/target/release/cache-rpc --rpc-api-url https://bridgesplit.genesysgo.net/ -l 0.0.0.0:8080 --config /build/config.toml