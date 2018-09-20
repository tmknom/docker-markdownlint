FROM alpine:3.8

RUN set -x && \
    apk add --no-cache nodejs nodejs-npm && \
    npm install -g markdownlint-cli && \
    apk del nodejs-npm && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/sh"]