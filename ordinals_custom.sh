#!/bin/bash


#Run first to check whether it runs successfully
ord --testnet --bitcoin-rpc-user foo --bitcoin-rpc-pass bar wallet balance


FEE_RATE=1
FILE="README.md"

echo "$FILE ${FEE_RATE}"