<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [istio-thrift-example](#istio-thrift-example)
  - [Get Started](#get-started)

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
kubectl -n thrift-demo exec -it -c demo `kubectl -n thrift-demo get po | grep client | awk '{print $1}'` -- ./server -addr=thrift-demo-server:10005
```

Clean

```
make clean 
```