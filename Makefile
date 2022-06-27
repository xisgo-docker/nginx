.PHONY: *

default: build push

build:
	docker --config ${HOME}/.config/xisgo-docker build --tag xisgo/nginx:$(v) .

push:
	docker --config ${HOME}/.config/xisgo-docker push xisgo/nginx:$(v)

images:
	docker --config ${HOME}/.config/xisgo-docker images xisgo/nginx