Electron Docker
====

## Base on

* [Electron](https://github.com/electron/electron)
* [Electron Quick Start](https://github.com/electron/electron-quick-start)

## Usage

```
FROM gitai/electron
LABEL maintainer "Gitai <i@gitai.me>"

...
```

```
docker run -d --rm\
    --volumes-from xorg \
    -e DISPLAY=:0 \
    --device /dev/dri \
    -v $HOME/app:~/app \
    --name electron-demo \
    gitai/electron
```

```shell
#!/bin/sh

echo Run $(basename $0) $* ...

curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" -d '{"Image": "gitai/electron", 
"Cmd": "'$*'", "Env": ["DISPLAY=:0"], "HostConfig" : {"VolumesFrom": ["desktop"], "AutoRemove": true}}' -X POST http:/v1.24/containers/create?name=electron

curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" -X POST http:/v1.24/containers/electron/start

echo Success!
```