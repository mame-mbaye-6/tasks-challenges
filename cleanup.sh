#!/bin/bash

<<<<<<< HEAD
# Delete the deployment and service
kubectl delete deployment hello-world-deployment
kubectl delete service hello-world-service

# Apply the new deployment and service
kubectl apply -f deployment.yml
=======
# Define variables
DEPLOYMENT_NAME="hello-world"
SERVICE_NAME="hello-world-service"
NAMESPACE="default"

# Delete previous deployment and service if they exist
kubectl delete deployment $DEPLOYMENT_NAME --namespace=$NAMESPACE --ignore-not-found=true
kubectl delete service $SERVICE_NAME --namespace=$NAMESPACE --ignore-not-found=true

# Apply new deployment
kubectl apply -f deployment.yml

>>>>>>> 7a651e4 (first task)
