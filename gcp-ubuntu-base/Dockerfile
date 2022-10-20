FROM alpine/gcloud:latest

# Installing the required utils
RUN apk add --update \
    curl \
    sudo \
    bash \
    git \
    openssl 

# Installing helm cli
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh

# installing helm cm-push plugin
RUN helm plugin install https://github.com/chartmuseum/helm-push

# installing kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# installing terraform
RUN sudo wget https://releases.hashicorp.com/terraform/1.3.3/terraform_1.3.3_linux_amd64.zip

RUN sudo unzip terraform_1.3.3_linux_amd64.zip

RUN sudo mv terraform /usr/bin/terraform