#Version: 0.0.1
#@edt M11 2018-2019
#kerberos base kserver.edt.org
#------------------------------------------
FROM fedora:27
LABEL author="@edt ASIX M11 Curs 2018-2019"
LABEL description="kerberos kserver.edt.org " 
RUN mkdir /opt/docker
RUN dnf -y install krb5-server krb5-workstation krb5-libs tree vim procps
COPY * /opt/docker/
RUN cp /opt/docker/krb5.conf /etc/krb5.conf
RUN cp /opt/docker/kdc.conf /var/kerberos/krb5kdc/kdc.conf
RUN cp /opt/docker/kadm5.acl /var/kerberos/krb5kdc/kadm5.acl
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
WORKDIR /opt/docker
#EXPOSE 389
CMD ["/opt/docker/startup.sh"]

