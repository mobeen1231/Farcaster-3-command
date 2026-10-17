#!/bin/bash
# Step 1: Setup Snapchain read node - No API keys!
set -e
echo ">>> Installing Docker & starting Snapchain read node..."

# Install docker
curl -fsSL https://get.docker.com | sh

# Clone compose file
cat > docker-compose.yml <<'EOF'
services:
  snapchain:
    image: farcasterxyz/snapchain:latest
    ports:
      - "3381:3381"
      - "3382:3382"
    volumes:
      - snapchain-data:/data
    command: ["--rpc-addr=0.0.0.0:3381", "--read-only=true"]
volumes:
  snapchain-data:
EOF

docker compose up -d
echo ">>> Read node started on port 3381"
echo ">>> Check: curl localhost:3381/v1/info"
echo ">>> Wait for isSyncing=false then run ./create-client.sh"
