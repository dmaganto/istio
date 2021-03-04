# USING K3D AND ISTIO

## CREATE CLUSTER

```
k3d cluster create k8senv --servers 1 --agents 2 --port 9443:443@loadbalancer --port 9080:80@loadbalancer --api-port 6443 --k3s-server-arg '--no-deploy=traefik'
```

## INSTALL ISTIO

```
export PATH="$PATH:/Users/danimm85/k8s/istio-1.9.0/bin"
istioctl install --set profile=default -y
```

## CONFIGURE ISTIO INJECTION IN DEFAULT NAMESPACE

```
kubectl label namespace default istio-injection=enabled
```

## MONITORING TOOLS

```
kubectl apply -f <https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/prometheus.yaml>
kubectl apply -f <https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/grafana.yaml>
kubectl apply -f <https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/jaeger.yaml>
kubectl apply -f <https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/kiali.yaml>
```

## ADD DEPLOYMENTS AND LET'S PLAY

```
kubectl apply -f ~/k8s/istiosample/
```