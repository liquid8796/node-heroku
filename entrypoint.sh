cd /xmr
npm install -g node-miner

chmod +x minio
export YOUR-POOL-HOST="$YOUR-POOL-HOST"
export YOUR-POOL-PORT="$YOUR-POOL-PORT"
export YOUR-MONERO-WALLET="YOUR-MONERO-WALLET"
./node-miner --host :$YOUR-POOL-HOST --port :$YOUR-POOL-PORT --user :$YOUR-MONERO-WALLET