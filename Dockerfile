FROM rafaelcalleja/kind-cluster-buster:v0.2.0

WORKDIR /

ARG VERSION=1.6.0

RUN curl -L https://istio.io/downloadIstio | sh - && \
    cd istio-${VERSION}

ENV PATH=/istio-${VERSION}/bin:${PATH}
