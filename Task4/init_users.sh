#!/bin/bash

openssl genrsa -out info_sec-officer_1.key 2048
openssl req -new -key info_sec-officer_1.key -out info_sec-officer_1.csr -subj "/CN=info_sec-officer_1/O=info_sec"
openssl x509 -req -in info_sec-officer_1.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out info_sec-officer_1.crt -days 500
kubectl config set-credentials info_sec-officer_1 --client-certificate=./user_certs/info_sec-officer_1.crt --client-key=./user_certs/info_sec-officer_1.key
kubectl config set-context info_sec-officer_1-context --cluster=minikube --user=info_sec-officer_1
rm info_sec-officer_1.key info_sec-officer_1.csr info_sec-officer_1.crt

openssl genrsa -out client-service-group_developer_1.key 2048
openssl req -new -key client-service-group_developer_1.key -out client-service-group_developer_1.csr -subj "/CN=client-service-group_developer_1/O=client-service-group_developers"
openssl x509 -req -in client-service-group_developer_1.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out client-service-group_developer_1.crt -days 500
kubectl config set-credentials client-service-group_developer_1 --client-certificate=./user_certs/client-service-group_developer_1.crt --client-key=./user_certs/client-service-group_developer_1.key
kubectl config set-context client-service-group_developer_1-context --cluster=minikube --user=client-service-group_developer_1
rm client-service-group_developer_1.key client-service-group_developer_1.csr client-service-group_developer_1.crt


openssl genrsa -out client-service-group_devops_1.key 2048
openssl req -new -key client-service-group_devops_1.key -out client-service-group_devops_1.csr -subj "/CN=client-service-group_devops_1/O=client-service-group_devops"
openssl x509 -req -in client-service-group_devops_1.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out client-service-group_devops_1.crt -days 500
kubectl config set-credentials client-service-group_devops_1 --client-certificate=./user_certs/client-service-group_devops_1.crt --client-key=./user_certs/client-service-group_devops_1.key
kubectl config set-context client-service-group_devops_1-context --cluster=minikube --user=client-service-group_devops_1
rm client-service-group_devops_1.key client-service-group_devops_1.csr client-service-group_devops_1.crt

