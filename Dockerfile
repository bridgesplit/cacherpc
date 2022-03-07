FROM ubuntu:20.04
COPY rust-toolchain /tmp/rust-toolchain
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y build-essential curl pkg-config libssl-dev git jq unzip
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain $(cat /tmp/rust-toolchain)
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup component add clippy && rustup component add rustfmt
RUN cargo build --release
CMD ["./cacherpc --rpc-api-url https://bridgesplit.genesysgo.net/ --log-file ./hello1 -l 127.0.0.1:80 --config ../config.toml"]