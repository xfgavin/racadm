FROM ubuntu:bionic

RUN apt-get -qq update \
    && apt-get install -y --force-yes gpg \
    && echo 'deb http://linux.dell.com/repo/community/openmanage/932/bionic bionic main' > /etc/apt/sources.list.d/linux.dell.com.sources.list \
    && gpg --recv-key 1285491434D8786F \
    && gpg -a --export 1285491434D8786F | apt-key add - \
    && apt-get -qq update \
    && apt-get -qq install -y --force-yes srvadmin-idracadm8 \
    && apt-get -qq purge gpg \
    && apt-get -qq autoremove \
    && apt-get -qq clean \
    && apt-get -qq autoclean \
ENTRYPOINT ["/opt/dell/srvadmin/sbin/racadm"]
