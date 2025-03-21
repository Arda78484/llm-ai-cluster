# LLM Cluster Deployment with LlamaCPP RPC

This guide provides instructions for deploying an LLM cluster using LlamaCPP RPC. The deployment requires two Docker images: one for the master node and one for the worker nodes. You can have multiple worker nodes, but only one master node.

## Docker Images

https://hub.docker.com/r/arda78484/llamacpp-rpcserver

## Prerequisites
- A NVIDIA Jetson Computer
- Jetpack 6 or higher
- Docker installed on all nodes (Docker version 1.26)
- All worker nodes connected to the same network

## Steps

### 1. Deploy Worker Nodes

Run the following command on each worker node. Make sure to use different ports for each worker:

```sh
docker run -e RPC_PORT=9010 -p 9010:9010 arda78484/llamacpp-rpcserver:worker
```

Replace `9010` with a different port number for each worker node.

### 2. Deploy Master Node

```sh
docker run --rm -it \
    -p 9090:9090 \
    -v ~/models:/root/.cache/llama.cpp \
    --entrypoint /bin/bash \
    arda78484/llamacpp-rpcserver:master \
    -c "cd /opt/llama.cpp/build-rpc-cuda && \
        bin/llama-cli -hf bartowski/Qwen2.5-14B-Instruct-GGUF \
                      -p \"Hello, my name is\" \
                      -n 1024 \
                      -ngl 99 \
                      --repeat_penalty 1.0 \
                      --rpc 192.168.1.156:9010,192.168.1.80:9020"
```

Or you can simply run master.sh

```sh
chmod +x master.sh
./master.sh
```

Ensure that the master node can communicate with all worker nodes on their respective ports.

## Conclusion

By following these steps, you will have a fully functional LLM cluster with LlamaCPP RPC. For further customization and configuration, refer to the `master.sh` and `worker.sh` scripts.

## References

Dustynv