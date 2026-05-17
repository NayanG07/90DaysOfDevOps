# Day 82 — EKS Networking and Storage

## Gateway API (Envoy Gateway)
- Replaces Ingress for more expressive routing
- GatewayClass → Gateway → HTTPRoute → Backend
- Installed via `oci://docker.io/envoyproxy/gateway-helm`

## cert-manager
- Let's Encrypt ClusterIssuer for automatic TLS
- Installed via `jetstack/cert-manager` Helm chart
- Issues certs for bankapp domain automatically

## EBS Storage
- PV provisioned with `awsElasticBlockStore` volume
- PVC in bankapp namespace requests 5Gi via `gp2` StorageClass
- EBS CSI driver handles dynamic provisioning and attachment
