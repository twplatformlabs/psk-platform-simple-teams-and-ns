#!/usr/bin/env bats

@test "evaluate simple teams external-dns pod status" {
  run bash -c "kubectl get pods -n istio-system -o wide | grep 'simple-teams-external-dns'"
  [[ "${output}" =~ "Running" ]]
}
