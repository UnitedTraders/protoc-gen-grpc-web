#!/bin/sh

PROTOS_DIR=/protos
OUTPUT_DIR=/out

args_with_output_dir=""

for arg in "$@"; do
    args_with_output_dir="${arg}:${OUTPUT_DIR} ${args_with_output_dir}"
done
protos_found=$(find ${PROTOS_DIR} -name "*.proto")

exec protoc \
    --proto_path=/usr/local/include:${PROTOS_DIR} \
    ${args_with_output_dir} \
    ${protos_found}
