FROM centos

RUN yum -y update \
 && yum -y install openssl pciutils wget \
 && wget -O /tmp/pkg.tgz https://dl.dell.com/FOLDER05920767M/1/DellEMC-iDRACTools-Web-LX-9.4.0-3732_A00.tar.gz \
 && tar -C /tmp -xf /tmp/pkg.tgz \
 && cd /tmp/iDRACTools/racadm/RHEL8/x86_64 \
 && rpm -i *.rpm \
 && ln -s `ls /usr/lib64/libssl.so.*|head -n1` /usr/lib64/libssl.so \
 && rm -rf /tmp/* \
 && yum -y clean all
ENTRYPOINT ["/opt/dell/srvadmin/sbin/racadm"]
