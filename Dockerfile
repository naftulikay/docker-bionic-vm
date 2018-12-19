FROM ubuntu:18.04
MAINTAINER Naftuli Kay <me@naftuli.wtf>
# with credits upstream: https://hub.docker.com/r/geerlingguy/docker-ubuntu1804-ansible/

ENV container=docker TERM=xterm LC_ALL=en_US LANGUAGE=en_US LANG=en_US.UTF-8

# packages
RUN apt-get update >/dev/null \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils locales language-pack-en dialog >/dev/null \
  && locale-gen $LANGUAGE $LANG \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    apt-utils python-minimal python-apt rsyslog systemd systemd-cron sudo ca-certificates >/dev/null \
  && rm -Rf /var/lib/apt/lists/* \
  && apt-get clean >/dev/null

# configuration
RUN perl -p -i -e 's/^(\$ModLoad\s+imklog).*/# $1/g' /etc/rsyslog.conf \
  && rm -f /etc/machine-id \
    /lib/systemd/system/multi-user.target.wants/getty.target

COPY --chown=root:root bin/fake-initctl /sbin/initctl
COPY --chown=root:root bin/systemd-await-target bin/wait-for-boot /usr/local/sbin/
RUN chmod 0700 /sbin/initctl /usr/local/sbin/systemd-await-target /usr/local/sbin/wait-for-boot

ENTRYPOINT ["/lib/systemd/systemd"]
