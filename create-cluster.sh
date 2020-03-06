#!/usr/bin/env bash
set -e

export DEFAULT_REGION='us-east-1'

export NAME=$1
export KOPS_STATE_STORE=s3://$2
export REGION=${3:-$DEFAULT_REGION}
export ZONES="${REGION}a"

kops create -f cluster/cluster.yaml
kops create secret --name $NAME sshpublickey admin -i ~/.ssh/id_rsa.pub
kops create -f cluster/ig-monitoring.yaml
kops create -f cluster/ig-ingress.yaml
kops update cluster $NAME --yes


# s3://kops-k8s-clusters
# cmendes.k8s.local