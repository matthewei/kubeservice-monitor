{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
We need to truncate to 50 characters due to the long names generated for pods
*/}}
{{- define "kubeservice-monitor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 50 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 26 chars due to the long names generated (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kubeservice-monitor.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 26 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 26 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 26 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/* Name suffixed with operator */}}
{{- define "kubeservice-monitor.operator.name" -}}
{{- printf "%s-prometheus-operator" (include "kubeservice-monitor.name" .) -}}
{{- end -}}

{{/* Name suffixed with prometheus */}}
{{- define "kubeservice-monitor.prometheus.name" -}}
{{- printf "%s-prometheus" (include "kubeservice-monitor.name" .) -}}
{{- end -}}

{{/* Name suffixed with alertmanager */}}
{{- define "kubeservice-monitor.alertmanager.name" -}}
{{- printf "%s-alertmanager" (include "kubeservice-monitor.name" .) -}}
{{- end -}}

{{/* Name suffixed with grafana */}}
{{- define "kubeservice-monitor.grafana.name" -}}
{{- printf "%s-grafa" (include "kubeservice-monitor.name" .) -}}
{{- end -}}

{{/* Fullname suffixed with operator */}}
{{- define "kubeservice-monitor.operator.fullname" -}}
{{- printf "%s-prometheus-operator" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/* Fullname suffixed with prometheus */}}
{{- define "kubeservice-monitor.prometheus.fullname" -}}
{{- printf "%s-prometheus" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/* Fullname suffixed with kube-state-metrics */}}
{{- define "kubeservice-monitor.kubeStateMetrics.fullname" -}}
{{- printf "%s-kube-state-metrics" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/* Fullname suffixed with metrics-server */}}
{{- define "kubeservice-monitor.metricsServer.fullname" -}}
{{- printf "%s-metrics-server" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/* Fullname suffixed with alertmanager */}}
{{- define "kubeservice-monitor.alertmanager.fullname" -}}
{{- printf "%s-alertmanager" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/*Prometheus Operator通过Statefulset的方式创建的Alertmanager实例，在默认情况下，
会通过alertmanager-"ALERTMANAGER_NAME"的命名规则去查找Secret配置并以文件挂载的方式，
将Secret的内容作为配置文件挂载到Alertmanager实例当中 */}}

{{/* Fullname suffixed with alertmanager Secret */}}
{{- define "kubeservice-monitor.alertManagerSecret.fullname" -}}
{{- printf "alertmanager-%s-alertmanager" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/* Fullname suffixed with alertManager ServiceName */}}
{{- define "kubeservice-monitor.alertManagerService.fullname" -}}
{{- printf "%s-alertmanager" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/* Fullname suffixed with grafana */}}
{{- define "kubeservice-monitor.grafana.fullname" -}}
{{- printf "%s-grafa" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/* Fullname suffixed with node-exporter */}}
{{- define "kubeservice-monitor.nodeExporter.fullname" -}}
{{- printf "%s-node-exporter" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/* Fullname suffixed with hw-exporter */}}
{{- define "kubeservice-monitor.hwExporter.fullname" -}}
{{- printf "%s-hw-exporter" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/* Fullname suffixed with blackbox-exporter */}}
{{- define "kubeservice-monitor.blackboxExporter.fullname" -}}
{{- printf "%s-blackbox-exporter" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/*
Labels for operator
*/}}
{{- define "kubeservice-monitor.operator.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: prometheus-operator
{{- end -}}

{{/*
Labels for prometheus
*/}}
{{- define "kubeservice-monitor.prometheus.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: prometheus
{{- end -}}

{{/*
Labels for kube-state-metrics
*/}}
{{- define "kubeservice-monitor.kubeStateMetrics.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: kube-state-metrics
{{- end -}}

{{/*
Labels for metrics-server
*/}}
{{- define "kubeservice-monitor.metricsServer.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: metrics-server
{{- end -}}

{{/*
Labels for alertmanager
*/}}
{{- define "kubeservice-monitor.alertmanager.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: alertmanager
{{- end -}}

{{/*
Labels for grafana
*/}}
{{- define "kubeservice-monitor.grafana.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: grafana
{{- end -}}

{{/*
Labels for node exporter
*/}}
{{- define "kubeservice-monitor.nodeExporter.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: node-exporter
{{- end -}}

{{/*
Labels for etcd
*/}}
{{- define "kubeservice-monitor.etcd.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: etcd
{{- end -}}

{{/*
Labels for coreDns
*/}}
{{- define "kubeservice-monitor.coreDns.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: coredns
{{- end -}}

{{/*
Labels for kube apiServer
*/}}
{{- define "kubeservice-monitor.kubeApiserver.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: kube-apiserver
{{- end -}}

{{/*
Labels for kube-controller-manager
*/}}
{{- define "kubeservice-monitor.kubeControllerManager.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: kube-controller-manager
{{- end -}}

{{/*
Labels for kube Scheduler
*/}}
{{- define "kubeservice-monitor.kubeScheduler.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: kube-scheduler
{{- end -}}

{{/*
Labels for kube kubelet
*/}}
{{- define "kubeservice-monitor.kubeKubelet.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: kube-kubelet
{{- end -}}

{{/*
Labels for kube storage
*/}}
{{- define "kubeservice-monitor.kubeStorage.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: kube-storage
{{- end -}}

{{/*
Labels for kube kubeSystemAppResource
*/}}
{{- define "kubeservice-monitor.kubeSystemAppResource.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: kube-system-app-resource
{{- end -}}

{{/*
Labels for customer Rules
*/}}
{{- define "kubeservice-monitor.customerRules.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: customer-rules
{{- end -}}

{{/*
Labels for hw exporter
*/}}
{{- define "kubeservice-monitor.hwExporter.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: hw-exporter
{{- end -}}

{{/*
Labels for kube proxy
*/}}
{{- define "kubeservice-monitor.kubeProxy.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: kube-proxy
{{- end -}}

{{/*
Labels for blackbox-exporter
*/}}
{{- define "kubeservice-monitor.blackboxExporter.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: blackbox-exporter
{{- end -}}

{{/*
matchLabels for operator
*/}}
{{- define "kubeservice-monitor.operator.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: prometheus-operator
{{- end -}}

{{/*
matchLabels for prometheus
*/}}
{{- define "kubeservice-monitor.prometheus.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: prometheus
service_role: prometheus-operator
{{- end -}}

{{/*
matchLabels for kube-state-metrics
*/}}
{{- define "kubeservice-monitor.kubeStateMetrics.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: kube-state-metrics
{{- end -}}

{{/*
matchLabels for kube-apiserver
*/}}
{{- define "kubeservice-monitor.kubeApiserver.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: kube-apiserver
{{- end -}}

{{/*
matchLabels for kube-controller-manager
*/}}
{{- define "kubeservice-monitor.kubeControllerManager.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: kube-controller-manager
{{- end -}}

{{/*
matchLabels for etcd
*/}}
{{- define "kubeservice-monitor.etcd.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: etcd
{{- end -}}

{{/*
matchLabels for metrics-server
*/}}
{{- define "kubeservice-monitor.metricsServer.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component:  metrics-server
{{- end -}}

{{/*
matchLabels for alertmanager
*/}}
{{- define "kubeservice-monitor.alertmanager.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: alertmanager
{{- end -}}

{{/*
matchLabels for grafana
*/}}
{{- define "kubeservice-monitor.grafana.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: grafana
{{- end -}}

{{/*
matchLabels for node-exporter
*/}}
{{- define "kubeservice-monitor.nodeExporter.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: node-exporter
{{- end -}}

{{/*
matchLabels for kube-proxy
*/}}
{{- define "kubeservice-monitor.kubeProxy.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: kube-proxy
{{- end -}}

{{/*
matchLabels for kube-scheduler
*/}}
{{- define "kubeservice-monitor.kubeScheduler.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: kube-scheduler
{{- end -}}

{{/*
matchLabels for hw-exporter
*/}}
{{- define "kubeservice-monitor.hwExporter.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: hw-exporter
{{- end -}}

{{/*
Return the proper Prometheus Operator image name
*/}}
{{- define "kubeservice-monitor.operator-image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.operator.image "global" .Values.global "harborRepo" .Values.harborRepo) -}}
{{- end -}}

{{/*
Return the proper Prometheus Operator Reloader image name
*/}}
{{- define "kubeservice-monitor.prometheusConfigReloader.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.operator.prometheusConfigReloader.image "global" .Values.global "harborRepo" .Values.harborRepo) -}}
{{- end -}}

{{/*
Return the proper Prometheus Kube RBAC Proxy image name
*/}}
{{- define "kubeservice-monitor.prometheusKubeRbacProxy.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.operator.prometheusKubeRbacProxy.image "global" .Values.global "harborRepo" .Values.harborRepo) -}}
{{- end -}}

{{/*
Return the proper kube-state-metrics Image name
*/}}
{{- define "kubeservice-monitor.kubeStateMetrics.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.kubeStateMetrics.image "global" .Values.global "harborRepo" .Values.harborRepo) -}}
{{- end -}}

{{/*
Return the proper Prometheus Image name
*/}}
{{- define "kubeservice-monitor.prometheus.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.prometheus.image "global" .Values.global "harborRepo" .Values.harborRepo) -}}
{{- end -}}

{{/*
Return the proper Metrics-server Image name
*/}}
{{- define "kubeservice-monitor.metricsServer.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.metricsServer.image "global" .Values.global "harborRepo" .Values.harborRepo) -}}
{{- end -}}

{{/*
Return the proper Alertmanager Image name
*/}}
{{- define "kubeservice-monitor.alertmanager.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.alertmanager.image "global" .Values.global "harborRepo" .Values.harborRepo) -}}
{{- end -}}

{{/*
Return the proper Grafana Image name
*/}}
{{- define "kubeservice-monitor.grafana.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.grafana.image "global" .Values.global "harborRepo" .Values.harborRepo) -}}
{{- end -}}

{{/*
Return the proper Node Exporter Image name
*/}}
{{- define "kubeservice-monitor.nodeExporter.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.nodeExporter.image "global" .Values.global "harborRepo" .Values.harborRepo) -}}
{{- end -}}

{{/*
Return the proper Hw Exporter Image name
*/}}
{{- define "kubeservice-monitor.hwExporter.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.hwExporter.image "global" .Values.global "harborRepo" .Values.harborRepo) -}}
{{- end -}}


{{/*
Return the proper Blackbox Exporter Image name
*/}}
{{- define "kubeservice-monitor.blackboxExporter.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.blackboxExporter.image "global" .Values.global "harborRepo" .Values.harborRepo) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "kubeservice-monitor.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.operator.image .Values.operator.prometheusConfigReloader.image .Values.prometheus.image .Values.alertmanager.image .Values.blackboxExporter.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create the name of the operator service account to use
*/}}
{{- define "kubeservice-monitor.operator.serviceAccountName" -}}
{{- if .Values.operator.serviceAccount.create -}}
    {{- default (include "kubeservice-monitor.operator.fullname" .) .Values.operator.serviceAccount.name -}}
{{- else -}}
    {{- default "default" .Values.operator.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the blackbox-exporter service account to use
*/}}
{{- define "kubeservice-monitor.blackboxExporter.serviceAccountName" -}}
{{- if .Values.blackboxExporter.serviceAccount.create -}}
    {{- default (include "kubeservice-monitor.blackboxExporter.fullname" .) .Values.blackboxExporter.serviceAccount.name -}}
{{- else -}}
    {{- default "default" .Values.blackboxExporter.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the prometheus service account to use
*/}}
{{- define "kubeservice-monitor.prometheus.serviceAccountName" -}}
{{- if .Values.prometheus.serviceAccount.create -}}
    {{- default (include "kubeservice-monitor.prometheus.fullname" .) .Values.prometheus.serviceAccount.name -}}
{{- else -}}
    {{- default "default" .Values.prometheus.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the kube-state-metrics service account to use
*/}}
{{- define "kubeservice-monitor.kubeStateMetrics.serviceAccountName" -}}
{{- if .Values.kubeStateMetrics.serviceAccount.create -}}
    {{- default (include "kubeservice-monitor.kubeStateMetrics.fullname" .) .Values.kubeStateMetrics.serviceAccount.name -}}
{{- else -}}
    {{- default "default" .Values.kubeStateMetrics.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the metrics-server service account to use
*/}}
{{- define "kubeservice-monitor.metricsServer.serviceAccountName" -}}
{{- if .Values.metricsServer.serviceAccount.create -}}
    {{- default (include "kubeservice-monitor.metricsServer.fullname" .) .Values.metricsServer.serviceAccount.name -}}
{{- else -}}
    {{- default "default" .Values.metricsServer.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the metrics-server clusterRole System Name to use
*/}}
{{- define "kubeservice-monitor.metricsServer.clusterRoleSystemName" -}}
{{- printf "%s-system" (include "kubeservice-monitor.metricsServer.fullname" .) -}}
{{- end -}}

{{/*
Create the name of the metrics-server aggregatedReader-clusterRole Name to use
*/}}
{{- define "kubeservice-monitor.metricsServer.aggregatedReaderClusterRoleName" -}}
{{- printf "%s-aggregated-reader" (include "kubeservice-monitor.metricsServer.fullname" .) -}}
{{- end -}}

{{/*
Create the name of the metrics-server clusterRoleBinding-AuthDelegator Name to use
*/}}
{{- define "kubeservice-monitor.metricsServer.authDelegatorClusterRoleBindingName" -}}
{{- printf "%s-auth-delegator" (include "kubeservice-monitor.metricsServer.fullname" .) -}}
{{- end -}}

{{/*
Create the name of the alertmanager service account to use
*/}}
{{- define "kubeservice-monitor.alertmanager.serviceAccountName" -}}
{{- if .Values.alertmanager.serviceAccount.create -}}
    {{- default (include "kubeservice-monitor.alertmanager.fullname" .) .Values.alertmanager.serviceAccount.name -}}
{{- else -}}
    {{- default "default" .Values.alertmanager.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the grafana service account to use
*/}}
{{- define "kubeservice-monitor.grafana.serviceAccountName" -}}
{{- if .Values.alertmanager.serviceAccount.create -}}
    {{- default (include "kubeservice-monitor.grafana.fullname" .) .Values.grafana.serviceAccount.name -}}
{{- else -}}
    {{- default "default" .Values.grafana.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the node-exporter service account to use
*/}}
{{- define "kubeservice-monitor.nodeExporter.serviceAccountName" -}}
{{- if .Values.alertmanager.serviceAccount.create -}}
    {{- default (include "kubeservice-monitor.nodeExporter.fullname" .) .Values.nodeExporter.serviceAccount.name -}}
{{- else -}}
    {{- default "default" .Values.nodeExporter.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the hw-exporter service account to use
*/}}
{{- define "kubeservice-monitor.hwExporter.serviceAccountName" -}}
{{- if .Values.alertmanager.serviceAccount.create -}}
    {{- default (include "kubeservice-monitor.hwExporter.fullname" .) .Values.hwExporter.serviceAccount.name -}}
{{- else -}}
    {{- default "default" .Values.hwExporter.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Return the etcd configuration configmap
*/}}
{{- define "kubeservice-monitor.blackboxExporter.configmapName" -}}
{{- if .Values.blackboxExporter.existingConfigMap -}}
    {{- printf "%s" (tpl .Values.blackboxExporter.existingConfigMap $) -}}
{{- else -}}
    {{- include "kubeservice-monitor.blackboxExporter.fullname" . -}}
{{- end -}}
{{- end -}}

{{/*
Compile all warnings into a single message, and call fail.
*/}}
{{- define "kubeservice-monitor.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{- printf "\nVALUES VALIDATION:\n%s" $message | fail -}}
{{- end -}}
{{- end -}}

{{/*
Return the Grafana admin credentials secret
*/}}
{{- define "kubeservice-monitor.grafana.adminSecretName" -}}
{{- printf "%s-grafa-admin" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/*
Return the Grafana admin password key
*/}}
{{- define "kubeservice-monitor.grafana.adminSecretPasswordKey" -}}
{{- printf "GF_SECURITY_ADMIN_PASSWORD" -}}
{{- end -}}

{{/*
Return the Grafana PersistentVolumeClaim Name
*/}}
{{- define "kubeservice-monitor.grafana.PersistentVolumeClaimName" -}}
{{- printf "%s-grafa" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/*
Return  the proper Storage Class
*/}}
{{- define "kubeservice-monitor.grafana.storageClass" -}}
{{- include "common.storage.class" (dict "persistence" .Values.grafana.persistence "global" .Values.global) -}}
{{- end -}}

{{/*
Return the Grafana Datasource Secret Name
*/}}
{{- define "kubeservice-monitor.grafana.datasourceSecretName" -}}
{{- printf "%s-grafa-datasource" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/*
Return the Grafana Dashboard Provider Name
*/}}
{{- define "kubeservice-monitor.grafana.dashboardProviderName" -}}
{{- printf "%s-grafa-dashboard-provider" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{/*

Return the Grafana Provider Definitions Name
*/}}
{{- define "kubeservice-monitor.grafana.providerDefinitionsName" -}}
{{- printf "%s-grafa-dashboards" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}


{{/*
Return the Prometheus Monitor Rules Name Or component name
*/}}
{{- define "kubeservice-monitor.kube-coreDns.DefinitionsName" -}}
{{- printf "%s-coredns" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{- define "kubeservice-monitor.etcd.DefinitionsName" -}}
{{- printf "%s-etcd" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{- define "kubeservice-monitor.nodeExporter.DefinitionsName" -}}
{{- printf "%s-node-exporter" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{- define "kubeservice-monitor.kubeApiserver.DefinitionsName" -}}
{{- printf "%s-kube-apiserver" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{- define "kubeservice-monitor.kubeControllerManager.DefinitionsName" -}}
{{- printf "%s-kube-controller-manager" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{- define "kubeservice-monitor.kubeScheduler.DefinitionsName" -}}
{{- printf "%s-kube-scheduler" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{- define "kubeservice-monitor.kubeKubelet.DefinitionsName" -}}
{{- printf "%s-kube-kubelet" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{- define "kubeservice-monitor.kubeStorage.DefinitionsName" -}}
{{- printf "%s-kube-storage" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{- define "kubeservice-monitor.kubeStateMetrics.DefinitionsName" -}}
{{- printf "%s-kube-state-metrics" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{- define "kubeservice-monitor.kubeProxy.DefinitionsName" -}}
{{- printf "%s-kube-proxy" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{- define "kubeservice-monitor.kubeSystemAppResource.DefinitionsName" -}}
{{- printf "%s-kube-system-app-resource" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{- define "kubeservice-monitor.blackboxExporter.DefinitionsName" -}}
{{- printf "%s-blackbox-exporter" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}

{{- define "kubeservice-monitor.customerRules.DefinitionsName" -}}
{{- printf "%s-customer-rules" (include "kubeservice-monitor.fullname" .) -}}
{{- end -}}