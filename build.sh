#!/bin/bash

curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=$1

git clone https://github.com/ethcore/parity
cd parity
git checkout $2
cargo build --release

curl --upload-file /root/parity/target/release/parity https://transfer.sh/parity
