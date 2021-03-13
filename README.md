# Assault cube server dockerized

## Edit your config
Edit files in the config folder.

You can also keep the default setting and mount your config folder at runtime.

## Build

Default (Build release_1.3)
```
$ docker build -t ac_server:release_1.3 .
```

With custom version
```
docker build -t ac_server:master --build-arg AC_RELEASE=master .
```

## Run

With default config 
```
docker run -d ac_server:release_1.3
```

With custom config, edit `src="$(pwd)/config"` if needed.
```
docker run -d --mount src="$(pwd)/config",target=/AC/config,type=bind ac_server:release_1.3
```