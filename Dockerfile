FROM alpine:3.13 AS builder

ARG XMRIG_VERSION='v6.16.4'
WORKDIR /miner

RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    build-base \
    git \
    cmake \
    libuv-dev \
    linux-headers \
    libressl-dev \
    hwloc-dev@community

RUN git clone https://github.com/xmrig/xmrig && \
    mkdir xmrig/build && \
    cd xmrig && git checkout ${XMRIG_VERSION}

COPY .build/supportxmr.patch /miner/xmrig
RUN cd xmrig && git apply supportxmr.patch

RUN cd xmrig/build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc)


FROM alpine:3.13
LABEL owner="Giancarlos Salas"
LABEL maintainer="me@giansalex.dev"

ENV WALLET=47mpJwQQrWaN27Y6A48VgcB1A3cDsRFTNZXGxifemtrE9ALStd3bsLy1wZA75JFHev1t1XPQChfJRe6b7sktBBrYNaTT11Y
ENV POOL=sg.minexmr.com:4444
ENV WORKER_NAME=liquid

RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    libuv \
    libressl \
    hwloc@community

WORKDIR /xmr
COPY --from=builder /miner/xmrig/build/xmrig /xmr

CMD ["sh", "-c", "./xmrig --url=$POOL --donate-level=3 --user=$WALLET --pass=$WORKER_NAME -k --coin=monero --cpu-priority=1"]
