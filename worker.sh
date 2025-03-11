#!/bin/bash

docker run -e RPC_PORT=9010 -p 9010:9010 arda78484/llamacpp-rpcserver:worker 