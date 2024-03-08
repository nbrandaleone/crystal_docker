# Dockerfile
FROM crystallang/crystal:latest

ADD . /src
WORKDIR /src

RUN crystal build --release --no-debug http_server.cr

RUN ldd ./http_server | tr -s '[:blank:]' '\n' | grep '^/' | \
    xargs -I % sh -c 'mkdir -p $(dirname deps%); cp % deps%;'

FROM scratch
COPY --from=0 /src/deps /
COPY --from=0 /src/http_server /http_server

EXPOSE 8080

ENTRYPOINT ["/http_server"]
