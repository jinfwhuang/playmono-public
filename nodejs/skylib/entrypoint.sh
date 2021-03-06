#!/bin/bash
set -euo pipefail

# _term() { 
#   echo "Caught SIGINT signal; killing child process" 
#   kill -TERM "$child" 2>/dev/null
# }
# trap _term SIGINT

# child=$! 
# wait "$child"


_term() {
  echo "---caught SIGINT/SIGTERM signal---" 
}
trap 'trap " " SIGTERM; kill 0; wait; _term' SIGINT SIGTERM

# Create symlinks
node create-links.js create 

# Start server
nohup node apps/docengineservice/dist/server/index.js "$@" &

wait
