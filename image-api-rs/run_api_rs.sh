#!/usr/bin/env bash

cargo build --release

export LD_LIBRARY_PATH=/home/coder/.wasmedge/lib64/

dapr run --app-id image-api-rs \
         --app-protocol http \
         --app-port 9004 \
         --dapr-http-port 3502 \
         --components-path ../config \
         --log-level debug \
         ./target/release/image-api-rs
