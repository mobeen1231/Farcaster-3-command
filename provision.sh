#!/bin/bash
# Step 0: Provision compute for Farcaster read node
# Docs: Uses Hetzner CX32 (4 vCPU, 16GB RAM) for Snapchain node
set -e
echo ">>> Provisioning Farcaster read node server..."
echo "Need HCLOUD_TOKEN env var from Hetzner Cloud"

hcloud server create \
  --name farcaster-read-node \
  --type cx32 \
  --image ubuntu-24.04 \
  --location nbg1 \
  --ssh-key default

IP=$(hcloud server ip farcaster-read-node)
echo ">>> Server ready at $IP"
echo ">>> SSH: hcloud server ssh farcaster-read-node"
echo ">>> Next: ./setup-read-node.sh"
