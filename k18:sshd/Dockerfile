#Version: 0.0.1
#@edt M11 2018-2019
#kerberos base kserver.edt.org
#------------------------------------------
FROM fedora:27
LABEL author="@edt ASIX M11 Curs 2018-2019"
LABEL description="SSH server kerberitzat = kserver.edt.org " 
RUN mkdir /opt/docker
RUN dnf -y install openssh-server openssh-clients krb5-workstation passwd tree vim procps nmap
COPY * /opt/docker/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
WORKDIR /opt/docker
CMD ["/opt/docker/startup.sh"]

