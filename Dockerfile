FROM centos:centos8
RUN dnf -q -y --nodocs --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos >/dev/null 2>&1\
 && yum -y -q install wget openssl-devel >/dev/null 2>&1\
 && wget -q -O - https://linux.dell.com/repo/hardware/dsu/bootstrap.cgi | bash >/dev/null 2>&1\
 && yum install -y -q srvadmin-idrac.x86_64 >/dev/null 2>&1 \
 && rm -rf /tmp/* \
 && yum -y -q clean all >/dev/null 2>&1
ENTRYPOINT ["/opt/dell/srvadmin/bin/idracadm7"]
