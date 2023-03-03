# Kubeservice-Monitor

Kubeservice-Monitor Chart包可以让你一键化快速安装一套基于Prometheus-Operator云原生监控系统。 该监控系统包括

> 基于`Prometheus`的`metrics`监控和报警

> 基于kube-state-metrics的metrics指标监控

> 基于Metrics-server的metics指标监控

> 基于`Grafana`的基本指标监控大盘

> 基于`Alertmanager`的告警通知管理系统

> 基于`告警记录`的重新指定了见名知意的监控指标


## 设计技术

1. [kube-prometheus stack](https://github.com/prometheus-operator/kube-prometheus)
2. [Prometheus Operator](https://github.com/prometheus-operator/prometheus-operator)
3. [Grafana](http://grafana.com/)
4. [Note-Expoter](https://github.com/prometheus/node_exporter)
5. [Kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)
6. [Metrics-server](https://github.com/kubernetes-sigs/metrics-server)

## 要求

- Kubernetes 1.18+
- Helm 3+

## 其他条件

- kubelet、apiserver、scheduler、etcd 、coreDns、kube-proxy和 controller manager 开启metrics

## 集群内部署

### Helm部署

```bash
$ cd kubeservice-monitor

$ vim value.yaml #编辑环境配置
  # 修改Target的Namespace

$ helm install kubeservice-monitor .   ## 部署

$ helm upgrade kubeservice-monitor .  ## 更新配置

$ helm delete kubeservice-monitor  --namespace **** ## 卸载
```

### Make命令部署

```bash
$ cd kubeservice-monitor

$ vim value.yaml #编辑环境配置
  # 修改Target的Namespace
  
$ make install   ## 部署
$ make uninstall ## 卸载
```

