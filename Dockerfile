FROM alpine:3.11

ENV KUBE_LATEST_VERSION="v1.18.2"

COPY entrypoint.sh /

RUN apk add --no-cache ansible ca-certificates bash git openssh curl && \
    wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    chmod +x /entrypoint.sh

CMD /entrypoint.sh
