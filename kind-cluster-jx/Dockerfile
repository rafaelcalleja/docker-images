FROM rafaelcalleja/kind-cluster-buster:v0.2.0

RUN apt update && \
    apt install --no-install-recommends -y \
    net-tools \
    sudo \
    vim \
    gettext && \
    cd /tmp && \
    curl -fsSL https://github.com/jenkins-x/jx/releases/download/v2.1.155/jx-linux-amd64.tar.gz | tar xzv && \
    mv jx /usr/local/bin && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

WORKDIR /

COPY kind-config.yaml /kind-config.yaml

RUN mv /entrypoint.sh /entrypoint-base.sh
COPY entrypoint-wrapper.sh /entrypoint.sh

RUN jx install dependencies --all && \
    jx version --short

ENV JX_HOME=/root/.jx/
ENV KUBECONFIG="${JX_HOME}"/config
ENV XDG_CONFIG_HOME="${JX_HOME}"
ENV PATH="${PATH}:${JX_HOME}/bin"
