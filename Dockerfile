FROM ubuntu:18.04
LABEL maintainer="Chef Software, Inc. <docker@chef.io>"

ARG EXPEDITOR_CHANNEL
ARG CHANNEL=stable
ARG EXPEDITOR_VERSION
ARG VERSION=0.9.42
ENV DEBIAN_FRONTEND=noninteractive \
    PATH=/opt/chefworkstation/bin:/opt/chefworkstation/embedded/bin:/root/.chefdk/gem/ruby/2.6.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Allow the build arg below to be controlled by either build arguments
ENV VERSION ${EXPEDITOR_VERSION:-${VERSION}}
ENV CHANNEL ${EXPEDITOR_CHANNEL:-${CHANNEL}}

# Run the entire container with the default locale to be en_US.UTF-8
RUN apt-get update && \
    apt-get install -y locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN apt-get update && \
    apt-get install -y git graphviz rsync ssh vim-tiny wget && \
    ln -s /usr/bin/vi /usr/bin/vim && \
    wget --content-disposition "http://packages.chef.io/files/${CHANNEL}/chef-workstation/${VERSION}/ubuntu/18.04/chef-workstation_${VERSION}-1_amd64.deb" -O /tmp/chef-workstation.deb && \
    dpkg -i /tmp/chef-workstation.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*log /var/log/apt/* /var/lib/dpkg/*-old /var/cache/debconf/*-old

CMD ["/bin/bash"]
