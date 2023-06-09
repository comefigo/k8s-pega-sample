FROM amazonlinux:2

ENV DOCKER_BUILDKIT=1

# Update all,upgrade pip
RUN yum update -y \
    && yum install -y git bash-completion vim unzip zip tar make openssl \
    && amazon-linux-extras install -y docker \
    && mkdir /workspace

# Add kubectl, stern
ADD https://storage.googleapis.com/kubernetes-release/release/v1.25.9/bin/linux/amd64/kubectl /usr/local/bin/kubectl

ADD https://github.com/stern/stern/releases/download/v1.22.0/stern_1.22.0_linux_amd64.tar.gz /tmp/stern.tar.gz

RUN tar -zxvf /tmp/stern.tar.gz -C /tmp/ \
    && cp /tmp/stern /usr/local/bin/stern \
    && chmod +x /usr/local/bin/kubectl \
    && kubectl version --client \
    && chmod +x /usr/local/bin/stern \
    && stern --version

ADD https://get.helm.sh/helm-v3.11.3-linux-amd64.tar.gz /tmp/helm.tar.gz

# Add helm
RUN mkdir /tmp/helm \
    && tar -zxvf /tmp/helm.tar.gz -C /tmp/helm/ \
    && chmod +x /tmp/helm/linux-amd64/helm \
    && mv /tmp/helm/linux-amd64/helm /usr/local/bin/helm \
    && helm version \
    && rm -rf /tmp/helm

# Add auto completer & alias
ADD .bashrc /tmp/
RUN cat /tmp/.bashrc >> /root/.bashrc

# Copy k8s config
COPY ./kube-config/config /root/.kube/
RUN chmod 600 -R /root/.kube/

WORKDIR /workspace
