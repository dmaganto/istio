#!/bin/bash
if [ $1 == 'create' ]
then
   k3d cluster create k8senv --servers 1 --agents 2 --port 9443:443@loadbalancer --port 9080:80@loadbalancer --api-port 6443 --k3s-server-arg '--no-deploy=traefik'
elif [$1 == 'stop' ]
then
   k3d cluster stop k8senv
elif [ $1 == 'delete' ]
then
   k3d cluster delete k8senv 
fi
