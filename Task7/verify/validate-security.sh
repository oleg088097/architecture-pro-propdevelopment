#!/bin/bash

#kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/v3.21.1/deploy/gatekeeper.yaml

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: audit-zone
EOF

kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/v3.21.1/deploy/gatekeeper.yaml

kubectl apply -f ../gatekeeper/constraint-templates/hostpath.yaml
kubectl apply -f ../gatekeeper/constraint-templates/privileged.yaml
kubectl apply -f ../gatekeeper/constraint-templates/runasnonroot.yaml

kubectl apply -f ../gatekeeper/constraints/hostpath.yaml
kubectl apply -f ../gatekeeper/constraints/privileged.yaml
kubectl apply -f ../gatekeeper/constraints/runasnonroot.yaml


kubectl apply -f ../insecure-manifests/01-privileged-pod.yaml
kubectl apply -f ../insecure-manifests/02-hostpath-pod.yaml
kubectl apply -f ../insecure-manifests/03-root-user-pod.yaml

kubectl apply -f ../secure-manifests/01-secure.yaml
kubectl apply -f ../secure-manifests/02-secure.yaml
kubectl apply -f ../secure-manifests/03-secure.yaml


#cleanup


cat <<EOF | kubectl delete -f -
apiVersion: v1
kind: Namespace
metadata:
  name: audit-zone
EOF

