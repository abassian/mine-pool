#!/bin/bash

gbas \
--datadir "$DATA_DIR" \
--networkid "$CHAIN_ID" \
--nat=none \
--port "$LISTEN_PORT" \
--rpc \
--rpcaddr 0.0.0.0 \
--rpcport "$RPC_PORT" \
--rpccorsdomain "*" \
--rpcapi db,debug,eth,net,web3 \
--rpcvhosts="*" \
--ws \
--wsaddr 0.0.0.0 \
--wsport "$WS_PORT" \
--wsorigins "*" \
--wsapi db,debug,eth,net,web3 \
--verbosity 4 \
--mine \
--minerthreads 0 \
--unlock "0x176e801aFE547ecB1f1471C9ECBCF222F036Ae74" \
--password $WALLET_PASSWORD_FILE_PATH \
--bootnodes "$BOOTNODES"
