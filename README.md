Electron Docker
====

## Base on

* [Electron](https://github.com/electron/electron)
* [Electron Quick Start](https://github.com/electron/electron-quick-start)

## Usage
```
docker run -d --rm\
    --volumes-from xorg \
    -e DISPLAY=:0 \
    --device /dev/dri \
    --name electron-demo \
    gitai/electron
```
