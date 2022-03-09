FROM rust:1.31
WORKDIR /build
COPY . /build
RUN cargo build --release
CMD /build/target/release/cache-rpc --rpc-api-url https://bridgesplit.genesysgo.net/ --config /build/config.toml