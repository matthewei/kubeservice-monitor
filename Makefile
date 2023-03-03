MONITOR_PATH  ?= $(shell pwd)
NAMESPACE     ?= $(shell helm show values . | grep "namespaceOverride:" |  awk -F ":" '{print $$2}')
RELEASE_NAME  ?= $(shell echo "kubeservice-monitor")
.PHONY: install
install:
	@echo ">> install kubeservice-monitor......"
	@echo ">> install kubeservice-monitor......"
	cd $(MONITOR_PATH)
	helm upgrade --install $(RELEASE_NAME)   .  -n $(NAMESPACE) --set harborRepo=cis-hub-chongqing-1.cmecloud.cn:443

.PHONY: uninstall
uninstall:
	@echo ">> uninstall kubeservice-monitor......"
	@echo ">> uninstall kubeservice-monitor......"
	helm delete $(RELEASE_NAME) -n $(NAMESPACE)
