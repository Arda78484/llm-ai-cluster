FROM dustynv/llama_cpp:r36.4.0

# Install dependencies for building llama.cpp
RUN apt-get update && apt-get install -y \
    apt-utils \
    cmake \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set working directory to llama.cpp directory
WORKDIR /opt/llama.cpp

# Build the CUDA backend with RPC support
RUN mkdir build-rpc-cuda && cd build-rpc-cuda \
    && cmake .. -DGGML_CUDA=ON -DGGML_RPC=ON -DLLAMA_CURL=ON\
    && cmake --build . --config Release

# Expose a default RPC port (can be overridden at runtime)
ENV RPC_PORT=60000
EXPOSE $RPC_PORT

# Start the RPC server with an adjustable port
CMD ["sh", "-c", "./build-rpc-cuda/bin/rpc-server -H 0.0.0.0 -p $RPC_PORT"]


