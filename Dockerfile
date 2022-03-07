COPY rust-toolchain /tmp/rust-toolchain
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain $(cat /tmp/rust-toolchain)
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup component add clippy && rustup component add rustfmt
RUN cargo build --release
CMD ["./cacherpc --rpc-api-url https://bridgesplit.genesysgo.net/ --log-file ./hello1 -l 127.0.0.1:80 --config ../config.toml"]