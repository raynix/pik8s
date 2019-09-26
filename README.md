# pik8s

I use these schema files to provision my own blog in a k8s cluster.

```
\
  +- wordpress-base <- base templates
  +- wordpress-site <- sample kustomize templates to provision a new site.
```

To preview generated schema, in `wordpress-site` dir:
```
$ kubectl apply -k . --dry-run -o yaml |less
```
