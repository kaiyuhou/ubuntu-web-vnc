# Ubuntu Web VNC Container 

Run Ubuntu Web VNC within Docker with one command!

**Credit**: based on [ConSol](https://github.com/ConSol/docker-headless-vnc-container) 's Version (achieved)

**Current TODOs**: [changelog and TODOs](changelog.md)

**Features**:

* Desktop environment: [**Xfce4**](http://www.xfce.org)
* VNCServer: latest [**TigerVNC**](https://github.com/TigerVNC/tigervnc)
  * which doesn't rely on unreliable `xstartup` to start desktop session!
* HTML5 VNC client: [**noVNC**](https://github.com/novnc/noVNC)
* Software:
  * Mozilla Firefox
  * Chromium (not work for ARM)
  * Sublime
  * Docker
 
## OS & UI sessions:

* `kaiyhou/ubuntu-web-vnc`: 
  * __Ubuntu 18.04__ with `Xfce4` UI session
      * X86-64
      * ARM-64
      
## Usage

- Run command with mapping to local port `8001` (vnc protocol) and `8002` (vnc web access):

      bash run-container.sh [password]
      
      # the latest tigerVNC server only allows localhost connections. So, 8001 cannot be accessd outside localhost.
      # in vnc_startup.sh, add "-localhost no" option to vncserver line would diable this setting.
      # TODO: add an option in run-container.sh

- Build an image from scratch:

      # for single arch
      bash build-dev.sh
      
      # for multi arch (amd64, arm64) with proper tags
      bash build-multi-arch.sh

# Connect & Control
If the container is started like mentioned above, connect via one of these options:

* __noVNC HTML5 full client__: [`http://localhost:8002/vnc.html`](http://localhost:8002/vnc.html), default password: `VNC_PASSWORD`
  * With clipboard and Scale!
* __noVNC HTML5 lite client__: [`http://localhost:8002/?password=VNC_PASSWORD`](http://localhost:8002/?password=VNC_PASSWORD) 

* **TODO**: connect via __VNC viewer `localhost:8001`__, default password: `VNC_PASSWORD`

## Hints

### 1) Extend a Image with your own software
All images run as non-root user per default, so if you want to extend the image and install software, you have to switch back to the `root` user:

```bash
## Custom Dockerfile
FROM kaiyhou/ubuntu-web-vnc

# Switch to root user to install additional software
USER 0

## Install a gedit
RUN apt-get install -y gedit \
    && apt-get clean all

## switch back to default user
USER ubuntu
```

### 2) Using root (user id `0`)
Add the `--user` flag to your docker run command:

    docker run -it --user 0 ... kaiyhou/ubuntu-web-vnc

### 2) Using user and group id of host system
Add the `--user` flag to your docker run command:

    docker run -it --user $(id -u):$(id -g) ... kaiyhou/ubuntu-web-vnc

### 3) Override VNC environment variables
The following VNC environment variables can be overwritten at the `docker run` phase to customize your desktop environment inside the container:
* `VNC_COL_DEPTH`, default: `24`
* `VNC_RESOLUTION`, default: `1600x900`
* `VNC_PW`, default: `VNC_PASSWORD`

#### 3.1) Example: Override the VNC password
Simply overwrite the value of the environment variable `VNC_PW`. For example in
the docker run command:

    docker run -it -e VNC_PW=my-pw ... kaiyhou/ubuntu-web-vnc

#### 3.2) Example: Override the VNC resolution
Simply overwrite the value of the environment variable `VNC_RESOLUTION`. For example in
the docker run command:

    docker run -it -e VNC_RESOLUTION=800x600 ... kaiyhou/ubuntu-web-vnc
    
### 4) View only VNC
Since version `1.2.0` it's possible to prevent unwanted control via VNC. Therefore you can set the environment variable `VNC_VIEW_ONLY=true`. If set, the startup script will create a random password for the control connection and use the value of `VNC_PW` for view only connection over the VNC connection.

     docker run -it -e VNC_VIEW_ONLY=true ... kaiyhou/ubuntu-web-vnc

### 5) Chromium crashes with high VNC_RESOLUTION 
The problem there is the too small `/dev/shm` size in the container. Except the solution below, we can also use `-v /dev/shm:/dev/shm`

    docker run --shm-size=256m -it VNC_RESOLUTION=1920x1080 ... kaiyhou/ubuntu-web-vnc
  

## Contributors

At this point we want to thank all contributors, which helped to move this great project by submitting code, writing documentation, or adapting other tools to play well together with the docker headless container.

* [Tobias Schneck](https://github.com/toschneck)
* [Robert Bohne](https://github.com/rbo) - IceWM images
* [hsiaoyi0504](https://github.com/hsiaoyi0504) - PR [#66](https://github.com/ConSol/docker-headless-vnc-container/pull/66)
* [dmhumph](https://github.com/dmhumph) - PR [#44](https://github.com/ConSol/docker-headless-vnc-container/issue/44) 
* [Simon Hofmann](https://github.com/s1hofmann)

## Changelog

The current changelog is provided here: **[changelog.md](./changelog.md)**

