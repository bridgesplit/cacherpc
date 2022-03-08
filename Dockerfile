FROM rust:1.31
WORKDIR /build
COPY . /build
RUN cargo build --release
CMD /build/target/release/cache-rpc --rpc-api-url https://bridgesplit.genesysgo.net/ -l 127.0.0.1:80 --config /build/config.toml