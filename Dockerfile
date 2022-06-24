FROM heroku/heroku:16

ADD entrypoint.sh /entrypoint.sh

RUN mkdir -p /mnt/xmr && \
    chmod +x /entrypoint.sh && \
    mkdir -m 777 /xmr

CMD /entrypoint.sh
