#!/bin/bash

set -euo pipefail

curl -G -s -k -H "Authorization: Bearer $(oc -n openshift-monitoring sa get-token prometheus-k8s)" --data-urlencode "query=$1" "https://$(oc -n openshift-monitoring get routes prometheus-k8s -o json | jq -r .spec.host)/api/v1/query" | jq
