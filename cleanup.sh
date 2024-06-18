#!/bin/bash

# Delete the deployment and service
kubectl delete deployment hello-world-deployment
kubectl delete service hello-world-service

# Apply the new deployment and service
kubectl apply -f deployment.yml
