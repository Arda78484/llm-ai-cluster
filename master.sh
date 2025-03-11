#!/bin/bash

# Define an array of worker IP:port addresses
workers=("192.168.1.156:9010" "192.168.1.80:9020")  # Add more workers as needed

MODEL_DIR="../models"
MODEL_ID="bartowski/Qwen2.5-14B-Instruct-GGUF"  ## Change it with the desired model from hugging face hub
PROMPT="Hello, my name is"
REPEAT_PENALTY="1.0"
TOKENS="1024" ## Adjust the number of output tokens as needed
NGL="99"

# Join workers array into a comma-separated string
workers_list=$(IFS=, ; echo "${workers[*]}")

# Build the llama-cli command with the desired arguments, including the comma-separated workers list
LLAMA_CLI_CMD="bin/llama-cli -m ${MODEL_DIR} -hf ${MODEL_ID} -p \"${PROMPT}\" --repeat-penalty ${REPEAT_PENALTY} -n ${TOKENS} --rpc ${workers_list} -ngl ${NGL}"

# Run the container with the entrypoint overridden via --entrypoint
docker run --rm -it \
    -p 9090:9090 \
    --entrypoint /bin/bash \
    arda78484/llamacpp-rpcserver:master \
    -c "cd /opt/llama.cpp/build-rpc-cuda" \
    -c "${LLAMA_CLI_CMD}"
