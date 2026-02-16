#!/bin/bash
{
# list secrets
jq 'select(.objectRef.resource=="secrets" and .verb=="list")' audit.log | jq -s '.' | jq '{ "secrets_access": . }'

# exec on container
jq 'select(.verb=="get" and .objectRef.subresource=="exec")' audit.log | jq -s '.' | jq '{ "exec": . }'

# start privileged container
jq 'select(.objectRef.resource=="pods" and .requestObject.spec.containers!=null and .requestObject.spec.containers[].securityContext.privileged==true)' audit.log  | jq -s '.' | jq '{ "start_privileged": . }'

# create RoleBinding
jq 'select(.verb=="create" and .objectRef.resource=="rolebindings")' audit.log | jq -s '.' | jq '{ "create_rolebindings": . }'
} | jq -s '.' > audit-extract.json
# rewrite audit-policy
#grep -i 'audit-policy' audit.log

