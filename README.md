# Assault cube server dockerized

/!\ Tested on LAN only for the moment /!\

## Edit your config
Edit files in the config folder.

You can also keep the default setting and mount your config folder at runtime.

## Build

Default (Build v1.3.0.2)
```
docker build -t ac_server:v1.3.0.2 .
```

Delete cache between 2 builds with different $AC_RELEASE (`docker system prune`)

With custom version
```
docker build -t ac_server:master --build-arg AC_RELEASE=master .
```

## Run

With default config 
```
docker run -d --expose 28763 -p 54.37.226.156:28763:28763/udp --expose 28762 -p 54.37.226.156:28762:28762/udp --expose 28764 -p 54.37.226.156:28764:28764/udp ac_server:v1.3.0.2 
```

With custom config, edit `src="$(pwd)/config"` if needed.
```
docker run -d --mount src="$(pwd)/config",target=/AC/config,type=bind --expose 28763 -p 54.37.226.156:28763:28763/udp --expose 28762 -p 54.37.226.156:28762:28762/udp --expose 28764 -p 54.37.226.156:28764:28764/udp ac_server:v1.3.0.2
```
