# Setup for NFT experiments

## General rules
### Remove line that starts with symbol, for example ;

```
sed '/^;/ d' < lnd.conf > output.conf
```

## Ordinals
### Check balance
```
ord --testnet --bitcoin-rpc-user foo --bitcoin-rpc-pass bar wallet balance

```

### Create inscription content
```
ord --testnet --bitcoin-rpc-user foo --bitcoin-rpc-pass bar wallet inscribe --fee-rate 1 README.md
```

**Inputs**: file and fee rate

**Outputs**:
- Commit transaction id
- Reveal transaction id
- Inscription id (revealTxId + i + index). For example: 3g12933nf3jki0 -> with i0


### Send inscriptions
Generate a new address to send:
```
ord --testnet --bitcoin-rpc-user foo --bitcoin-rpc-pass bar wallet receive
```

Send the inscription:
```
ord --testnet --bitcoin-rpc-user foo --bitcoin-rpc-pass bar wallet send --fee-rate 1 <ADDRESS> <INSCRIPTION_ID>
```

### Testnet address (should top up into this address)
tb1p8nucr8e94g7ps9n4uttfvh2cn5cn3n8ynds5tcals9wkdw083h5sfy3qs7

## Taro
### Setup btcd, lnd
- Wallet paraphrase: 12345678
- Open btcd, lnd
- Next, unlock this script through the command: lncli unlock
### Open taro
```
tapd --network=testnet --debuglevel=debug --lnd.host=localhost:10009 --lnd.macaroonpath=~/.lnd/data/chain/bitcoin/testnet/admin.macaroon --lnd.tlspath=.lnd/tls.cert
```
### Example of creating an asset
```
tapcli assets mint --type normal --name fantasycoin --supply 100 --meta_bytes "fantastic money"
{
    "batch_key": "038fb1774dd467161b790c54ff9403bd930851e4c22334839a9d48805e04f6598f"
}

```