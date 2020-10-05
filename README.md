<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [istio-thrift-example](#istio-thrift-example)
  - [Get Started](#get-started)
  - [Known Issue](#known-issue)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# istio-thrift-example
Running thrift service on istio

The idea is to use EnvoyFilter(https://istio.io/docs/reference/config/networking/envoy-filter/) to patch LDS

## Get Started

Create namespace and workloads(a thrift client and a thrift server)

```
make install
```

Test sending request from client to server

```
kubectl -n thrift-demo exec -it -c demo `kubectl -n thrift-demo get po | grep client | awk '{print $1}'` -- /example -addr=thrift-demo-server:10005
```

Verify Envoy receive correct listener config

```
kubectl -n thrift-demo exec -it -c istio-proxy `kubectl -n thrift-demo get po | grep client | awk '{print $1}'` --  curl http://127.0.0.1:15000/config_dump | less

# Then search "_10005" to find the outbound listener
```

Verify stats

```
kubectl -n thrift-demo exec -it -c istio-proxy `kubectl -n thrift-demo get po | grep client | awk '{print $1}'` --  curl http://127.0.0.1:15000/stats/prometheus | grep thrift
```

Clean

```
make clean 
```

## Known Issue

Only tested with istio 1.6, try to modify EnvoyFilter configuration if not working for other istio releases.