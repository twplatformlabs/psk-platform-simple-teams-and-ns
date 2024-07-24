#!/usr/bin/env bash
set -eo pipefail

export cluster_name=$1

# Load the simple sample teams data for the current cluster
json_file=environments/$cluster_name-teams.json

# Read the list of teams
teams=$(jq -r 'keys[]' $json_file)

# Iterate over each team
for team in $teams; do
  echo "team: $team"
  
  # Read the namespaces that should exist for the current team
  namespaces=$(jq -r --arg k "$team" '.[$k][]' $json_file)
  
  # Iterate over each namespace
  for namespace in $namespaces; do
    echo "  namespace: $namespace"

    cat <<EOF > $team-namespace_with_quota.yaml
---
apiVersion: v1
kind: Namespace
metadata:
  name: $team-$namespace
  labels:
    istio-injection: enabled
    pod-security.kubernetes.io/warn: restricted
    pod-security.kubernetes.io/audit: restricted
    pod-security.kubernetes.io/warn: baseline
    pod-security.kubernetes.io/audit: baseline
    pod-security.kubernetes.io/enforce: baseline

---
apiVersion: v1
kind: ResourceQuota
metadata:
  name: $team-$namespace-ns-quota
  namespace: $team-$namespace
spec:
  hard:
    requests.cpu: "2"
    requests.memory: 2Gi
    limits.cpu: "10"
    limits.memory: 20Gi
EOF



  done
done