#!/bin/bash

minikube delete --all

mkdir -p ~/.minikube/files/etc/ssl/certs
cp -f ./audit-policy.yaml ~/.minikube/files/etc/ssl/certs/audit-policy.yaml

minikube start \
  --extra-config=apiserver.audit-policy-file=/etc/ssl/certs/audit-policy.yaml \
  --extra-config=apiserver.audit-log-path=-

sleep 60

bash ./simulate-incident.sh > console.log

kubectl logs  kube-apiserver-minikube -n kube-system | grep '^{'  > audit.log

bash ./analyze.sh
