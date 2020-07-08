# racadm

Dell EMC iDRAC Tools for Linux, v9.4.0 in a centos docker container.

Usage:

```
docker run -v `pwd`:/mnt xfgavin/racadm -r 192.168.79.12 -u username -p password getconfig -f /mnt/config.txt
```
