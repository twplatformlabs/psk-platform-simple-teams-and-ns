#!/usr/bin/env bash
set -eo pipefail

export cluster_name=$1

if [[ "$cluster_name" == "sbx-i01-aws-us-eat-1"]]; then
  export testenv=preview
else
  export testenv=dev
fi

bash scripts/toggle_httpbin.sh on $cluster_name

jsonResponse=$(curl -X GET "https://httpbin.$testenv.twdps.io/json" -H "accept: application/json")
echo "response $jsonResponse"
if [[ ! $jsonResponse =~ "slideshow" ]]; then
  echo "httpbin not responding"
  exit 1
fi

bash scripts/toggle_httpbin.sh off $cluster_name
