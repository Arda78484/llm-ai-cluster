# Use the specified base image
FROM arda78484/llamacpp-rpcserver:worker

# Change directory to /root/.cache and remove any existing llama.cpp directory
RUN cd /root/.cache && rm -rf llama.cpp && mkdir llama.cpp

# Set the working directory inside the container
WORKDIR /opt/llama.cpp

# Set an environment variable for the master RPC port
ENV MASTER_RPC_PORT=9090

# Expose the specified port
EXPOSE $MASTER_RPC_PORT

# Define the command to run when the container starts
CMD ["bin/llama-cli"]