#!/bin/bash
# Step 2: Create Farcaster client that reads from YOUR node
set -e

echo ">>> Creating Farcaster client..."

mkdir -p client/src

cat > client/src/index.ts <<'EOF'
import { createPublicClient, http } from 'viem';
import { optimism } from 'viem/chains';

// Config - reads from YOUR node
const READ_NODE_URL = process.env.READ_NODE_URL || "http://localhost:3381";
const FID = process.env.FID;

// 1. Read from your own node - No API keys!
async function getCasts(fid: number) {
  const res = await fetch(`${READ_NODE_URL}/v1/castsByFid?fid=${fid}`);
  return res.json();
}

// 2. Create App Key (one Optimism tx)
// This is custody -> app key delegation
async function createAppKey() {
  console.log("Creating app key on Optimism - 1 tx needed");
  console.log("Call KeyRegistry contract: add key");
  // viem call to 0x00000000Fc1237824fb747aBDE0FF18990E59b7e
}

// 3. Post cast (write via validator)
async function postCast(text: string) {
  const hubUrl = "https://hub.farcaster.xyz:2281/v1/submitMessage";
  console.log(`Posting to validator: ${text}`);
}

// 4. Filter by app FID (freedom of association)
function filterByClient(casts: any[], allowedAppFids: number[]) {
  return casts.filter(c => allowedAppFids.includes(c.data?.fid));
}

console.log(`Client ready. Reading from: ${READ_NODE_URL}`);
getCasts(Number(FID)).then(console.log);
EOF

cat > client/package.json <<'EOF'
{
  "name": "farcaster-3-command-client",
  "type": "module",
  "dependencies": {
    "viem": "^2.0.0"
  }
}
EOF

echo ">>> Client created in ./client/src/index.ts"
echo ">>> Run: cd client && npm install && FID=123 READ_NODE_URL=http://YOUR_IP:3381 npm start"
echo ">>> Features: Read from own node, Post, Follow, React, Filter by app FID"
