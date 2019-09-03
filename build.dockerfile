FROM quay.io/podman/stable

USER root

RUN yum update -y
RUN yum install -y jq 
RUN yum install -y gettext
RUN yum install -y findutils
RUN yum install -y which

# Install oc and kubectl
RUN mkdir -p /install
RUN curl https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux-4.1.13.tar.gz -o /install/openshift-client.tar.gz
RUN tar xvfz /install/openshift-client.tar.gz -C /usr/local/bin

# Install docker shim
COPY docker /usr/bin/docker
RUN chmod +x /usr/bin/docker

# Add user namespace mappings so podman can run rootless
RUN echo "jenkins:1000000000:999999" | tee /etc/subuid
RUN echo "jenkins:1000000000:999999" | tee /etc/subgid

# Ensure files can be read/written by the jenkins (runtime) user
RUN chgrp -R 0 /etc/subuid && chmod g=u /etc/subuid
RUN chgrp -R 0 /etc/subgid && chmod g=u /etc/subgid

# Ensure that we can add an entry for the Jenkins user on startup
RUN chmod g=u /etc/passwd
RUN chmod -R 777 /home

# Setup docker registry configuration for podman
COPY registries.conf /etc/containers/registries.conf
RUN chgrp -R 0 /etc/containers/registries.conf && chmod g=u /etc/containers/registries.conf

COPY init.sh /init.sh
RUN chmod 777 /init.sh

# Store the tag/version for this container for debugging
ARG TAG
ENV TAG=${TAG}