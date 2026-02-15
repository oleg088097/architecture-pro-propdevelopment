#!/bin/bash

kubectl create role client-service-group_developer --verb=get,list --resource=pods,pods/log --namespace=client-service-group

kubectl create role client-service-group_devops --verb=* --resource=deployments,pods,services,configmaps,persistentvolumes --namespace=client-service-group

kubectl create clusterrole info_sec-officer --verb=get,list --resource=secrets
