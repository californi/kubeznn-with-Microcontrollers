
# Target system is at https://github.com/californi/Microcontrollers-python-version 
# kubeznn-with-Microcontrollers

## k8s-testbed
## A testbed for performance testing in kubernetes clusters

## Running
## Run each command in the following order below. The order matters!

## monitoring: 
kubectl apply -k monitoring
## kube-znn: 
kubectl apply -k .\kube-znn\overlay\default\
## nginxc-ingress: 
kubectl apply -f nginxc-ingress

## Customising Kubow with microcontrollers...
## kubow: 
kubectl apply -k kubow/overlay/kube-znn


## to test the nginx from kube-znn pod
kubectl logs kube-znn-56d544655f-nbgqj -c nginx