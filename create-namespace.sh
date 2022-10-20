#!/bin/bash

set -euo pipefail

function log {
  echo "$@"
  return 0
}

ISTIO_NS=istio-system
CERT_MANAGER_NS=cert-manager

# create istio-system namespace
NS=$(kubectl get namespace $ISTIO_NS --ignore-not-found);
if [[ "$NS" ]]; then
  log "✅ Skipping creation of namespace $ISTIO_NS - already exists";
else
  log "✅ Creating namespace $ISTIO_NS";
  sudo kubectl create namespace $ISTIO_NS;
fi;


# create certificate manager namespace
NS=$(kubectl get namespace $CERT_MANAGER_NS --ignore-not-found);
if [[ "$NS" ]]; then
  log "✅ Skipping creation of namespace $CERT_MANAGER_NS - already exists";
else
  log "✅ Creating namespace $CERT_MANAGER_NS";
  sudo kubectl create namespace $CERT_MANAGER_NS;
fi;