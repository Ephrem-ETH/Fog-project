#/bin/sh
kind create cluster --config kind-cluster.yaml --name $USER --image node_nfs
