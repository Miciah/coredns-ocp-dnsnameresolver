#!/bin/bash
set -euo pipefail

function verify_crd {
  local SRC="$1"
  local DST="$2"
  if ! diff -Naup "$SRC" "$DST"; then
    echo "invalid CRD: $SRC => $DST"
    exit 1
  fi
}

verify_crd \
  "vendor/github.com/openshift/api/network/v1alpha1/0000_70_dnsnameresolver_00-techpreview.crd.yaml" \
  "pkg/manifests/assets/0000_70_dnsnameresolver_00-techpreview.crd.yaml"

verify_crd \
  "vendor/github.com/openshift/api/network/v1alpha1/0000_70_dnsnameresolver_00-techpreview.crd.yaml" \
  "config/crd/bases/network.openshift.io.openshift.io_dnsnameresolvers.yaml"