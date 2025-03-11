FROM arda78484/llamacpp-rpcserver:worker

WORKDIR /opt/llama-cli

ENV MASTER_RPC_PORT=60001

EXPOSE $MASTER_RPC_PORT

CMD ["bin/llama-cli"]