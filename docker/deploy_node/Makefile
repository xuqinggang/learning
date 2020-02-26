NAME = toutiao.nodejs
VERSION = v1.0
REGISTRY=sandbox.hub.byted.org
REGISTRY_ONLINE=hub.byted.org
.PHONY: all build tag_online tag_dev

all: build

build:
	docker build --no-cache --force-rm -t $(NAME):$(VERSION) ./

run:
	docker run  $(NAME):$(VERSION) /sbin/my_init -- ls


tag_dev:
	docker tag  $(NAME):$(VERSION) $(REGISTRY)/$(NAME):$(VERSION)

tag_online:
	docker tag  $(NAME):$(VERSION) $(REGISTRY_ONLINE)/$(NAME):$(VERSION)

install_dev:
	docker push $(REGISTRY)/$(NAME):$(VERSION)

install_online:
	docker push $(REGISTRY_ONLINE)/$(NAME):$(VERSION)

bash:
	docker run -it -v /sys/fs/cgroup:/sys/fs/cgroup:ro $(NAME):$(VERSION) bash

