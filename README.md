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
