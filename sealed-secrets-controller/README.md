# Get public key from sealed-secrets-controller

1. start `kubectl proxy`
1. `curl http://localhost:8001/api/v1/namespaces/sealed-secrets/services/sealed-secrets-controller/proxy/v1/cert.pem`
