# Farcaster 3-Command Client + Read Node

> Build your own Farcaster client that reads from your own node. No API keys needed.

**Quickstart - 3 Commands:**

```bash
# 0. Provision compute (Hetzner / DO / AWS)
curl -sSL https://raw.githubusercontent.com/mobeen1231/Farcaster-3-command/main/provision.sh | bash

# 1. Setup Snapchain read node (runs on its own, no keys)
./setup-read-node.sh

# 2. Create client that reads from your node + writes via validator
./create-client.sh
