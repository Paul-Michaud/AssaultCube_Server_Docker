FROM ubuntu:latest AS build

ARG AC_RELEASE
ENV AC_RELEASE=${AC_RELEASE:-release_1.3}

ARG TZ
ENV TZ=${TZ:-Europe/Paris}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
   echo "$TZ" > /etc/timezone && \
   apt update && \
   apt -y upgrade && \
   apt install -y build-essential git clang libvorbis-dev libopenal-dev libsdl2-image-dev && \
   git clone -b "$AC_RELEASE" --single-branch  https://github.com/assaultcube/AC.git

WORKDIR /AC/source/src

RUN make server_install

FROM ubuntu:latest

COPY --from=build /AC/bin_unix/ /AC/bin_unix/
COPY --from=build /AC/packages/maps/ /AC/packages/maps/ 

ADD config /AC/config

WORKDIR /AC

ENTRYPOINT ["bin_unix/native_server"]

CMD ["-Cconfig/servercmdline.txt"]