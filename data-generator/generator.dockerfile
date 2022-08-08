FROM ubuntu:latest

ENV TANZU_CLI_VERSION=v1.3.1

RUN apt update

RUN echo "Installing System Libraries" \
  && apt-get update \
  && apt-get install -y build-essential python3.6 python3-pip python3-dev groff bash-completion git curl unzip wget findutils jq vim tree docker.io

RUN echo "Installing kubectl" && \
      apt install -y curl && \
      curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
      chmod +x ./kubectl && \
      mv ./kubectl /usr/local/bin/kubectl

RUN echo "Installing postgresql-client" && \
    apt-get install postgresql-client -y


COPY bin/tanzu-framework-linux-amd64.tar .
RUN echo "Installing Tanzu CLI" \
  && mkdir -p tanzu \
  && tar xvf tanzu-framework-linux-amd64.tar -C tanzu \
  && cd tanzu/cli 3\
  && install core/v0.11.6/tanzu-core-linux_amd64 /usr/local/bin/tanzu \
  && tanzu version 


# #Install Tanzu CLI Plugins
RUN echo "Installing Tanzu CLI Plugins" \
  && cd tanzu \
  && tanzu plugin install insight --local cli \
  && tanzu plugin list


# Configure  insight cli

# RUN kubectl get secret app-tls-cert -n metadata-store -o json | jq -r '.data."ca.crt"' | base64 -d > metadata-ca.crt
# RUN export METADATA_STORE_ACCESS_TOKEN=$(kubectl get secrets -n metadata-store -o jsonpath="{.items[?(@.metadata.annotations['kubernetes\.io/service-account\.name']=='metadata-store-read-write-client')].data.token}" | base64 -d)
# RUN tanzu insight config set-target https://metadata-store.tap.add2cloud.com --access-token=$METADATA_STORE_ACCESS_TOKEN --ca-cert metadata-ca.crt

