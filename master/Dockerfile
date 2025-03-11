# Use the specified base image
FROM arda78484/llamacpp-rpcserver:worker

# Set the working directory inside the container
WORKDIR /opt/llama.cpp

# Set an environment variable for the master RPC port
ENV MASTER_RPC_PORT=9090

# Expose the specified port
EXPOSE $MASTER_RPC_PORT

# Define the command to run when the container starts
CMD ["bin/llama-cli"]