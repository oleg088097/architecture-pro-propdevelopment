#!/bin/bash

kubectl create clusterrolebinding info_sec-officer_1-info_sec-officer-binding --clusterrole=info_sec-officer --user=info_sec-officer_1

kubectl create rolebinding client-service-group_developer_1-client-service-group_developer-binding --role=client-service-group_developer --user=client-service-group_developer_1 --namespace=client-service-group

kubectl create rolebinding client-service-group_devops_1-client-service-group_devops-binding --role=client-service-group_devops --user=client-service-group_devops_1 --namespace=client-service-group
